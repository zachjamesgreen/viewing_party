class MoviesController < ApplicationController
  def index
    response = Faraday.get 'https://api.themoviedb.org/3/movie/top_rated?api_key=27a7c24d7fe8773fe89ef2006a4a2331'
    require "pry"; binding.pry
  end
end