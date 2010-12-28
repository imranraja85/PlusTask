class UserMailer < ActionMailer::Base
  default :from => "notifications@example.com"

  def send_calendar_invite(users, dates)
    #@user = User.find users.first
    date="20101215"
content="BEGIN:VCALENDAR
CALSCALE:GREGORIAN
X-WR-TIMEZONE;VALUE=TEXT:US/Pacific
METHOD:PUBLISH
PRODID:-//Apple Computer\, Inc//iCal 1.0//EN
X-WR-CALNAME;VALUE=TEXT:Example
VERSION:2.0
BEGIN:VEVENT
SEQUENCE:5
DTSTART;TZID=US/Pacific:20021028T140000
DTSTAMP:20021028T011706Z
SUMMARY:Coffee with Jason
UID:FC9434B1-FF64-11D6-4444-003065F99D04
DTEND;TZID=US/Pacific:20021028T150000
BEGIN:VALARM
TRIGGER;VALUE=DURATION:-P1D
ACTION:DISPLAY
DESCRIPTION:Event reminder
END:VALARM
END:VEVENT
END:VCALENDAR"

xcontent = "BEGIN:VCALENDAR
CALSCALE:GREGORIAN
X-WR-TIMEZONE;VALUE=TEXT:US/Eastern
METHOD:PUBLISH
PRODID:-//Apple Computer\, Inc//iCal 1.0//EN
X-WR-CALNAME;VALUE=TEXT:Example
VERSION:2.0
BEGIN:VEVENT
SEQUENCE:5
DTSTART:#{date}T140000
DTSTAMP:#{date}T011706Z
SUMMARY:Coffee with Jason
UID:EC9439B1-FF65-11D6-9973-003065F99D04
DTEND:#{date}T150000
BEGIN:VALARM
TRIGGER;VALUE=DURATION:-P1D
ACTION:DISPLAY
DESCRIPTION:Event reminder
END:VALARM
END:VEVENT
END:VCALENDAR"
    
    attachments["cal.ics"] = {
     :mime_type => "text/Calendar",
     :content => content}
    
    mail(:to => "iraja1215@gmail.com",
         :subject => "welcome to my site",
         "Content-Type" => "text/Calendar",
         "Content-Disposition" => "inline; filename=calendar.ics")
  end
end
