class MoviesFacade
  class << self
    def discover
      json = TMDBService.discover
      movie_creator(json)
    end

    def search(query)
      json = TMDBService.search(query)
      movie_creator(json)
    end

    def top_rated(page)
      json = TMDBService.top_rated(page)
      movie_creator(json)
    end

    def find(id)
      json = TMDBService.find(id)
      if json[:success] == false
        nil
      else
        MovieDetail.new(json)
      end
    end

    private

    def movie_creator(json)
      json[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end
end
