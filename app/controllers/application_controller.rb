class ApplicationController < ActionController::Base

  load_and_authorize_resource except: [:home, :help, :about, :contact], unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |expection|
    redirect_to root_url, alert: expection.message
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception
  
  before_filter :set_user_language
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :birthday, :password, :password_confirmation, :language)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :birthday, :password, :password_confirmation, :language)}
  end

  private
  def set_user_language
    I18n.locale = current_user.language if user_signed_in?
  end
end
