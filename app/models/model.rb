class Model < ActiveRecord::Base
  
	has_many :posts
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  model = Model.where(:provider => auth.provider, :uid => auth.uid).first
    unless model
      model = Model.new(provider:auth.provider,
       uid:auth.uid,
       email:auth.info.email,
       password:Devise.friendly_token[0,20]
       )
      
    end
    model
  end


  def self.new_with_session(params, session)
    super.tap do |model|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        model.email = data["email"] if model.email.blank?
      end
    end
  end
end
