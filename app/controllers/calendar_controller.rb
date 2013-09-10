class CalendarController < ApplicationController

  has_scope :month

  def calendar
    @punchcards_by_date = apply_scopes( Punchcard
                                        .select("punchout, punchin, date(created_at) as date, job_id")
                                        .where( user: current_user )
                                        .group_by(&:date)
                                      )
    @work_hours_per_week = current_user.current_job && current_user.current_job.hours_per_week ? current_user.current_job.hours_per_week : 45
    @work_seconds_per_week = 60 * 60 * @work_hours_per_week
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

end
