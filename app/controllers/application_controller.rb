class ApplicationController < ActionController::Base

  protected
    
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname lname image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fname lname image])
  end
end
