class DashboardController < ApplicationController
  before_action :require_login
  def index
    @user = current_user
    # require "pry"; binding.pry
    @my_view_parties = @user.view_parties
    @attending_view_parties = ViewPartyUser.where(user_id: @user.id).parties
  end
end
