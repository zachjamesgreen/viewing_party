class MoviesFacade
  class << self
    def movies_discover(page)
      json = TMDBService.discover(page)
      json[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end
end
