class MoviesController < ApplicationController
  before_action :require_login
  def discover
    @movies = TMDBService.discover[0..3]
  end

  def movies
    if params[:search] && !(params[:search] == '')
      @movies = TMDBService.search(params[:search])
    else
      @movies = TMDBService.discover
    end
  end

  def search; end

  def show
    @movie = TMDBService.movie(params[:id])
  end

  def top_rated
    @movies = TMDBService.top_rated(1) + TMDBService.top_rated(2)
  end
end
