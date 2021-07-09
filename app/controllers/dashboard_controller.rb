class DashboardController < ApplicationController
  def index
    @user = current_user
    @my_view_parties = @user.view_parties
    @attending_view_parties = ViewPartyUser.where(user_id: @user.id).parties
  end
end
