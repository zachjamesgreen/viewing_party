class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    user[:username] = user[:username].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user[:username]}!"
      redirect_to '/'
    else
      flash[:error] = "Sorry, account not created! Incorrect/missing info"
      redirect_to '/register'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
