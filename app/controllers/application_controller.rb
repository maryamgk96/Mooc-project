class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to courses_url, notice: exception.message
  end
  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :date_of_birth, :gender, :profile_picture, :role) }
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :date_of_birth, :gender, :profile_picture) }
      end
end
