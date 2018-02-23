class QrCodesController < ApplicationController
  def new
    authorize :user, :new?
  end

  def create
    @qr = RQRCode::QRCode.new( qr_code_params[:text], size: 4)
    authorize :user, :create?
  end

private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end
end
