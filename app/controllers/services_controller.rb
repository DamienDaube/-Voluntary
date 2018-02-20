class ServicesController < ApplicationController

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    authorize @service
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
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
    authorize Service.new
    # @services = ServicePolicy::Scope.new(current_user, Service).list_filtered(params[:category])
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
  end

  def destroy
    @service = Service.find(params[:id])
    authorize @service
    @service.destroy
    redirect_to service_categories_path
  end

  private

  def service_params
    params.require(:service).permit(:category,:price, :id)
  end
end
