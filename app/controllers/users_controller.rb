class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:sucess] = "Welcome!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "invalided!"
      render :new
    end
  end

  def edit
  end

private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
