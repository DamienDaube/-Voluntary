class BookingsController < ApplicationController

  def new
    @service = Service.find(params[:id])
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:id])
    @booking.service = @service
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @service = @booking.service
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :show
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :paid)
  end

end
