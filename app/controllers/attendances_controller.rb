class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:attended_event_id])
    @attendance = current_user.attendances.build(attended_event: @event)
    if @attendance.save
      redirect_to @event, notice: "You are now attending this event."
    else
      redirect_to @event, alert: "Failed to attend this event."
    end
  end

  def destroy
    @attendance = current_user.attendances.find(params[:id])
    @event = @attendance.attended_event

    if @attendance.destroy
      redirect_to @event, notice: "You have unattended this event."
    else
      redirect_to @event, alert: "Failed to unattend this event."
    end
  end
end
