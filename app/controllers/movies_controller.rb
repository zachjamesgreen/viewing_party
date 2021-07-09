class MoviesController < ApplicationController

  def discover
    # use discover endpoint only 4
    @movies = TMDBService.discover[0..3]
  end

  def movies
    # only 40
    @movie = {
      id: 1,
      poster_path: '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg',
      vote_average: 8.2,
      title: 'F9',
      runtime: 138
    }
  end

  def search; end

  def show
    @movie = TMDBService.movie(508943)
  end
end
