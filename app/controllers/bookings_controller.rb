class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @workspace = Workspace.find(params[:workspace_id])
  end
end
