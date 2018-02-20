class UsersController < ApplicationController
  USER_ROLES = ["beneficiary", "sponsor", "provider", "admin"]

  before_action :set_user, only: [:show, :edit, :update]

  def show?
    record.user == user
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
