module ApplicationHelper

  def fmt_month_day_year(date)
    raise "Must pass date object" if date.nil?
    date.strftime("%b %d %Y")
  end
end
