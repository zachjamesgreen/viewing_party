class TMDBService
  class << self
    def discover
      url = 'https://api.themoviedb.org/3/discover/movie'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'] })
      body = JSON.parse(res.body, symbolize_names: true)
    end

    def search(query)
      url = 'https://api.themoviedb.org/3/search/movie'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], query: query })
      body = JSON.parse(res.body, symbolize_names: true)
    end

    def find(id)
      url = "https://api.themoviedb.org/3/movie/#{id}"
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], append_to_response: 'reviews,credits' })
      body = JSON.parse(res.body, symbolize_names: true)
    end

    def top_rated(page)
      url = 'https://api.themoviedb.org/3/movie/top_rated'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], page: page })
      body = JSON.parse(res.body, symbolize_names: true)
    end
  end
end
