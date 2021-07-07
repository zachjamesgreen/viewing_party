class MoviesController < ApplicationController
  def discover
    # use popular endpoint only 4
    # response = Faraday.get 'https://api.themoviedb.org/3/movie/popular?api_key=27a7c24d7fe8773fe89ef2006a4a2331'
    @image_base_url = 'https://image.tmdb.org/t/p/original'
    @movie = {
      poster_path: '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg',
      vote_average: 8.2,
      title: 'F9',
      backdrop_path: '/xXHZeb1yhJvnSHPzZDqee0zfMb6.jpg'
    }
  end

  def movies; end
  def search; end
  def movie; end
end
