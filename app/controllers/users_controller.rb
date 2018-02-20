class UsersController < ApplicationController
  USER_ROLES = ["beneficiary", "sponsor", "provider", "admin"]

  before_action :set_user, only: [:show, :edit, :update]

  def show
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
