class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "application"

  def index
    @today = Punchcard.find_by date: Time.now.to_date
    @this_week = Punchcard.this_week
  end

  def punch_in
    if current_user
      Punchcard.create!( date: Time.now.to_date, punchin: Time.now )
      render nothing: true
    else
      redirect_to '/auth/facebook'
    end
  end

  def punch_out
    if current_user
      pc = Punchcard.find_by date: Time.now.to_date
      pc.update!( punchout: Time.now)
      render nothing: true
    else
      redirect_to '/auth/facebook'
    end
  end

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end
