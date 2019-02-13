class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.create(stripe_customer_id: params[:stripe_customer_id])
    @attendance.guest = current_user
    @attendance.event_id = params[:event_id]

    if @attendance.save
      redirect_to event_path(@attendance.event)
    else
      flash[:error] = "Ta participation n'a pas été prise en compte"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def index
    @attendances = Attendance.all
  end
end
