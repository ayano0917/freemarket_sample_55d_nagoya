class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    divise_parameter_sanitizer.permit(:)

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def not_used_auth_production
    if Rails.env.production?
      @facebook_path = "#"
      @google_path  = "#"
    else
      @facebook_path = user_facebook_omniauth_authorize_path
      @google_path = user_google_oauth2_omniauth_authorize_path
    end
end
