class Post < ActiveRecord::Base
  belongs_to :model
  has_many :comments

	def self.search(search)
		if search
			find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
			
			
		else
			find(:all)
		end
	end
end
