class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params[:email] = user_params[:email].downcase
    new_user = User.new(user_params)
    if new_user.save
      flash[:success] = "Welcome, #{new_user[:username]}!"
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Sorry, account not created! Incorrect/missing info'
      redirect_to register_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
