class TMDBService
  class << self
    def discover
      url = 'https://api.themoviedb.org/3/discover/movie'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'] })
      json_parser(res)
    end

    def search(query)
      url = 'https://api.themoviedb.org/3/search/movie'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], query: query })
      json_parser(res)
    end

    def find(id)
      url = "https://api.themoviedb.org/3/movie/#{id}"
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], append_to_response: 'reviews,credits' })
      json_parser(res)
    end

    def top_rated(page)
      url = 'https://api.themoviedb.org/3/movie/top_rated'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], page: page })
      json_parser(res)
    end

    def json_parser(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
