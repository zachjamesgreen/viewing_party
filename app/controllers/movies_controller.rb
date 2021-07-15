class MoviesController < ApplicationController
  before_action :require_login
  def discover
    @movies = MoviesFacade.discover[0..3]
  end

  def movies
    @movies = if params[:search] && params[:search] != ''
                MoviesFacade.search(params[:search])
              else
                MoviesFacade.discover
              end
  end

  def show
    @movie = MoviesFacade.find(params[:id])
    render file: 'public/404.html', status: :not_found if @movie.nil?
  end

  def top_rated
    @movies = MoviesFacade.top_rated(1) + MoviesFacade.top_rated(2)
  end
end
