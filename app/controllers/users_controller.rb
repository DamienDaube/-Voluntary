class UsersController < ApplicationController
  USER_ROLES = ["beneficiary", "sponsor", "provider", "admin"]

  before_action :set_user, only: [:show, :edit, :update]

  def show
    @bookings = Booking.where(user: current_user)
    @user = current_user
    @service = Service.new()
    @provider_bookings = current_user.provider_bookings
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
