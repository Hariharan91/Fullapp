class Models::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/model.rb)
    found_model = Model.find_for_facebook_oauth(request.env["omniauth.auth"])
    Rails.logger.info "------------"
    Rails.logger.info found_model
    if found_model
      sign_in_and_redirect found_model, :event => :authentication #this will throw if @model is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_model_registration_url
    end
  end
end
