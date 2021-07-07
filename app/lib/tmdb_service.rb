class TMDBService


  def self.discover
    url = 'https://api.themoviedb.org/3/discover/movie'
    res = Faraday.get(url, {api_key: ENV['TMDB_API_KEY']})
    movies = []
    body = JSON.parse(res.body, symbolize_names: true)
    body[:results].each do |movie|
      # require "pry"; binding.pry
      movies << Movie.new(movie)
    end
    movies
  end
end