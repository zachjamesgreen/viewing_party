class ViewPartiesController < ApplicationController
  before_action :require_login
  def new
    @movie = MovieDetail.parse(params[:movie])
    @viewing_party = ViewParty.new
  end

  def create
    movie_id = view_party_params[:movie_id]
    duration = view_party_params[:duration].to_i
    movie = TMDBService.movie(movie_id)
    duration = movie.runtime if movie.runtime > duration
    view_party = ViewParty.create!(
      user_id: current_user.id, movie_id: movie.id,
      event_time: parse_event_time, duration: duration, movie_title: movie.title
    )
    friends_array&.each do |friend|
      ViewPartyUser.create!(view_party_id: view_party.id, user_id: friend.id)
    end
    redirect_to dashboard_path
  end

  private

  def view_party_params
    params.require(:view_party).permit(
      'movie_title',
      'movie_id', 'duration', 'date(1i)',
      'date(2i)', 'date(3i)', 'time(4i)',
      'time(5i)', 'friends' => []
    )
  end

  def parse_event_time
    year = view_party_params['date(1i)']
    month = view_party_params['date(2i)']
    day = view_party_params['date(3i)']
    hour = view_party_params['time(4i)']
    minute = view_party_params['time(5i)']
    Time.zone.local(year, month, day, hour, minute)
  end

  def friends_array
    view_party_params[:friends]&.filter_map do |id|
      User.find id.to_i if id != '0'
    end
  end
end
