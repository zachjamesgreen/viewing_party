class UserFriendsController < ApplicationController
  def create
    user = current_user
    friend = User.find_by(email: params[:email])
    new_friendship = user.user_friends.new(user: user, friend: friend)
    if new_friendship.save
      flash[:success] = "#{friend.username} added as a friend!"
      redirect_to dashboard_path
    end
  end
end