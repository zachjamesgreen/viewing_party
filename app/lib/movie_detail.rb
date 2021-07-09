class MovieDetail < Movie
  attr_reader :runtime, :overview, :genres, :cast, :reviews

  def initialize(info)
    super(info)
    @runtime = info[:runtime]
    @overview = info[:overview]
    @genres = info[:genres]
    @cast = if info[:credits]
              info[:credits][:cast]
            else
              info[:cast]
            end
    @reviews = if info[:reviews].is_a?(Array)
                 info[:reviews]
               elsif !info[:reviews].nil?
                 info[:reviews][:results]
               end
  end

  def self.parse(movie)
    MovieDetail.new(JSON.parse(movie, symbolize_names: true))
  end
end
