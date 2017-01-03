class UsersController < ApplicationController
  include Sessionable

  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.create(user_params)
    if @user.save
      set_session
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
