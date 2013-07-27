class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "application"

  def index
    @today_punchcard = Punchcard.find_or_initialize_by punchin: Time.now
  end

  def punch_in

  end

end
