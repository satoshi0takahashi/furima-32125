class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_katakana, :last_name_katakana, :birth])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end