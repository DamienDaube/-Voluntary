class ServicesController < ApplicationController

  def index
    if params[:query].present?
      @services = policy_scope(Service).where("category ILIKE ?", "%#{params[:query]}%")
      if !@services.any?
        redirect_to service_categories_path
      else
        @category = @services.first.category
      end
    else
      @services = policy_scope(Service).all
      @category = "All services"
    end
  end

  def create
    @service = Service.new(service_params)
    @service.lat = 0
    @service.lng = 0
    authorize @service
    if @service.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  # def index
  #   @services = policy_scope(Service)
  # end

  def index_service_categories
    @categories = Service.pluck(:category).uniq
    authorize Service.new
  end

  # def index
  #   @services = ServicePolicy::Scope.new(current_user, Service).list_all
  # end

  def index_services_by_category
    @services = Service.where(category: params[:category])
    @booking = Booking.new
    authorize Service.new

    @services_for_marker = @services.where.not(latitude: nil, longitude: nil)

    @markers = @services_for_marker.map do |service|
      {
        lat: service.latitude,
        lng: service.longitude,
      }
    end
    # @services = ServicePolicy::Scope.new(current_user, Service).list_filtered(params[:category])
  end

  def destroy
    @service = Service.find(params[:id])
    authorize @service
    @service.destroy
    redirect_to service_categories_path
  end

  private

  def service_params
    params.require(:service).permit(:category,:price, :id, :address)
  end
end
