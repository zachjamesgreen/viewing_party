class ViewPartiesController < ApplicationController
  def new
    @movie = MovieDetail.parse(params[:movie])
    @viewing_party = ViewParty.new(user_id: 1, movie_id: @movie.id)
  end

  def create
    # use filter map to get friend ids from form
    # view_party_params[:friends].filter_map { |f| f.to_i if f != "0"}
    require "pry"; binding.pry
  end

  private

  def view_party_params
    params.require(:view_party).permit('duration', 'date(1i)', 'date(2i)', 'date(3i)', 'time(4i)', 'time(5i)', 'friends'=>[] )
  end
end