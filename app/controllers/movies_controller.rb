class MoviesController < ApplicationController
  before_action :require_login
  def discover
    # use discover endpoint only 4
    @movies = TMDBService.discover[0..3]
  end

  def movies
    if params[:search] && !(params[:search] == '')
      @movies = TMDBService.search(params[:search])
    else
      @movies = TMDBService.discover[0..39]
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
end
