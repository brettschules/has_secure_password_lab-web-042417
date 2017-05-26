class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])


    if user && user.authenticate(params[:password])
      flash[:sucess] = "Welcome"
      session[:user_id] = user.id
      byebug
      redirect_to user_path(user)
    else
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path

  end


end
