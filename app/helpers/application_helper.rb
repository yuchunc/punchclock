module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert-success"
    when :error then "alert-error"
    when :alert then ""
    end
  end

  def cal_overtime(punchcard, work_seconds_week, date)
    punchcard.punchout ||= date.end_of_day
    worked_seconds = punchcard.punchout - punchcard.punchin
    if ![0, 6].include? date.wday
      worked_seconds - work_seconds_week/5
    else
      worked_seconds
    end
  end

  def cal_overtime_pay(overtime, pay_per_hour, date)
    case date.wday
    when 0, 6
      pay_per_hour * 2
    else
      if overtime <= 2
        (pay_per_hour * overtime * 1.33).to_i
      else
        ((pay_per_hour * 2 * 1.33) + (pay_per_hour * (overtime - 2)  * 1.66)).to_i
      end
    end
  end

end
