module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert-success"
    when :error then "alert-error"
    when :alert then ""
    end
  end

  def cal_workhour(punchcard, date)
    punchcard.punchout ||= date.end_of_day
    punchcard.punchout - punchcard.punchin
  end

  def cal_overtime(worked_time, work_seconds, date)
    ![0, 6].include? date.wday ? worked_time - work_seconds/5 : work_time
  end

end
