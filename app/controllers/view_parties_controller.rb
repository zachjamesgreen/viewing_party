class ViewPartiesController < ApplicationController
  def new
    @movie = MovieDetail.parse(params[:movie])
    @viewing_party = ViewParty.new
  end

  def create
    event_time = get_event_time
    friends = get_friends_array
    movie_id = view_party_params[:movie_id]
    # movie_name = view_party_params[:movie_name]
    duration = view_party_params[:duration]
    view_party = ViewParty.create(movie_id: movie_id, event_time: event_time, duration: duration)
    ViewPartyUser.create(user_id: current_user.id, view_party_id: view_party.id)
    get_friends_array.each do |friend|
      ViewPartyUser.create(view_party_id: view_party.id, user_id: friend.id)
    end
    require "pry"; binding.pry
  end

  private

  def view_party_params
    params.require(:view_party).permit('movie_id', 'duration', 'date(1i)', 'date(2i)', 'date(3i)', 'time(4i)', 'time(5i)', 'friends'=>[] )
  end

  def get_event_time()
    year= view_party_params['date(1i)']
    month = view_party_params['date(2i)']
    day = view_party_params['date(3i)']
    hour = view_party_params['time(4i)']
    minute = view_party_params['time(5i)']
    Time.local(year,month,day,hour,minute)
  end

  def get_friends_array()
    view_party_params[:friends].filter_map do |id|
      if id != '0'
        User.find id.to_i
      end
    end
  end
end