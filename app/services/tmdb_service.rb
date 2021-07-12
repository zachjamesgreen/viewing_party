class TMDBService
  class << self
    def discover(page)
      url = 'https://api.themoviedb.org/3/discover/movie'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], page: page })
      body = JSON.parse(res.body, symbolize_names: true)

      # body[:results].map do |movie|
      #   Movie.new(movie)
      # end
    end

    def search(query)
      url = 'https://api.themoviedb.org/3/search/movie'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], query: query })
      body = JSON.parse(res.body, symbolize_names: true)
      body[:results].map do |movie|
        Movie.new(movie)
      end
    end

    def movie(id)
      url = "https://api.themoviedb.org/3/movie/#{id}"
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], append_to_response: 'reviews,credits' })
      body = JSON.parse(res.body, symbolize_names: true)
      if body[:success] == false
        return nil
      else
        MovieDetail.new(body)
      end
    end

    def top_rated(page)
      url = 'https://api.themoviedb.org/3/movie/top_rated'
      res = Faraday.get(url, { api_key: ENV['TMDB_API_KEY'], page: page })
      body = JSON.parse(res.body, symbolize_names: true)
      body[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end
end
