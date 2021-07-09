class TMDBService
  def self.discover
    url = 'https://api.themoviedb.org/3/discover/movie'
    res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'] })
    body = JSON.parse(res.body, symbolize_names: true)
    body[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(query)
    url = 'https://api.themoviedb.org/3/search/movie'
    res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], query: query})
    body = JSON.parse(res.body, symbolize_names: true)
    body[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
