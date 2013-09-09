class CalendarController < ApplicationController

  has_scope :month

  def calendar
    @punchcards = apply_scopes( Punchcard.where( user: current_user ) )
  end

end
