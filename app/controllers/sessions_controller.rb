class SessionsController < ApplicationController
  # skip_before_action :require_login
  def welcome; end

  def login; end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      session['user_id'] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Sorry your info is not correct'
      redirect_to login_path
    end
  end
end
