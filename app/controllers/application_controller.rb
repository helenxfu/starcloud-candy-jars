class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  helper_method :logged_in?

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
