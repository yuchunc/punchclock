class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "application"

  def index
    @today = Punchcard.find_by punchin: Time.now.to_date
    @this_week = Punchcard.this_week
  end

  def punch_in
  end

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end
