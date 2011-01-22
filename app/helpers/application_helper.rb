module ApplicationHelper

  def fmt_month_day_year(date)
    raise "Must pass date object" if date.nil?
    date.strftime("%b %d %Y")
  end

  def fmt_two_digit(date)
    raise "Must pass date object" if date.nil?
    date.strftime("%m/%d/%y")
  end

  def link_to_lightbox(name, path, html_options = {})
    options = (html_options).merge!({:class=>"lightbox #{html_options.fetch(:class) if html_options.has_key?(:class)}"})
    link_to(name, path, options)
  end
  
end
