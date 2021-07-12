class MoviesFacade
  class << self
    def discover
      json = TMDBService.discover
      json[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end
end
