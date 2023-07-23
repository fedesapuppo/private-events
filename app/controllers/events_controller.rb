class EventsController < ApplicationController
  def index
    @events = Event.all
    @user = current_user if user_signed_in?
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
    @attendance = current_user.attendances.find_by(attended_event: @event)
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: "Event deleted successfully."
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
