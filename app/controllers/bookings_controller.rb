class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    @booking.status = "pending"
    @booking.paid = false
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to service_categories_path
    else
      redirect_to service_category_path(@service.category)
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
    params.require(:booking).permit(:start_date, :end_date, :status, :paid, :service_id)
  end

end
