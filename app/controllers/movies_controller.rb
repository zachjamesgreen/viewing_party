class MoviesController < ApplicationController
  before_action :require_login
  def discover
    @movies = MoviesFacade.discover[0..3]
  end

  def movies
    @movies = if params[:search] && params[:search] != ''
                TMDBService.search(params[:search])
              else
                MoviesFacade.discover
              end
  end

  def search; end

  def show
    @movie = TMDBService.movie(params[:id])
    if @movie.nil?
      render file: 'public/404.html', status: :not_found
      return
    end
  end

  def top_rated
    @movies = TMDBService.top_rated(1) + TMDBService.top_rated(2)
  end
end
