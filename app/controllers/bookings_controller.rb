class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @workspace = Workspace.find(params[:workspace_id])
  end

  def create
    @booking = Booking.new(booking_params)

    # then we need to set the booking's user_id and workspace_id
    @booking.user = current_user

    @workspace = Workspace.find(params[:workspace_id])
    @booking.workspace = @workspace

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
