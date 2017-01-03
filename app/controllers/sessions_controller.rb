class SessionsController < ApplicationController
  include Sessionable

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      set_session
      redirect_to root_path
    elsif
      @user.nil?
      @user = User.new
      @user.errors[:username] << "was not found"
      render :new
    elsif
      @user.errors[:password] << "is incorrect"
      render :new
    end
  end

  def create_with_facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
