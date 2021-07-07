class SessionsController < ApplicationController
  def welcome; end

  def login; end

  def create
    user = User.find_by_username params[:username]
    if user && user.authenticate(params[:password])
      session['user_id'] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Sorry your info is not correct"
      redirect_to login_path
    end

  end
end
