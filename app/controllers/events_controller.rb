class EventsController < ApplicationController
  layout "manageme"

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(params[:event])
    people_to_notify = params[:users].keys if params[:users]
    date = params[:event][:start_date]

    if @event.save
      flash[:notice] = "Successfully scheduled event"
      UserMailer.send_calendar_invite(people_to_notify, date).deliver
      redirect_to root_url
    else
      flash[:notice] = "Failed to schedule event"
      redirect_to root_url
    end
  end
end
