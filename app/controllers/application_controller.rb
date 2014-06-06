class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    redirect_to login_url, alert: 'Please log in first' if current_user.nil?
  end

  def can_administer?
    redirect_to root_url, alert: 'Access denied.' unless administrator?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def administrator?
    current_user && current_user.admin?
  end

  helper_method :administrator?
end
