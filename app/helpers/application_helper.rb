module ApplicationHelper

  def fmt_month_day_year(date)
    raise "Must pass date object" if date.nil?
    date.strftime("%b %d %Y")
  end

  def fmt_two_digit(date)
    raise "Must pass date object" if date.nil?
    date.strftime("%m/%d/%y")
  end
end
