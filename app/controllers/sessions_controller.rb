class SessionsController < ApplicationController
  
  before_action :logged_in_redirect, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You Have Successfully Logged In"
      redirect_to root_path
    else
      flash.now[:error] = "There Was Something Wrong With Your Login Information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You Have Successfully Logged Out"
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You Are Allready Logged In"
      redirect_to root_path
    end
  end


end