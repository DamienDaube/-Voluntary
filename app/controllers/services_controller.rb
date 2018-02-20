class ServicesController < ApplicationController
  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = 1
    if @service.save
      redirect_to service_path(@service)
    else
      raise
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
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:category,:price, :id)
  end

end
