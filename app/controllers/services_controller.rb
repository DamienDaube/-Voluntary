class ServicesController < ApplicationController

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    authorize @service
    if @service.save
      redirect to services_path(@service)
    else
      render :new
    end
  end

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to root
  end

  private

  def service_params
    params.require(:service).permit(:category,:price)
  end
end
