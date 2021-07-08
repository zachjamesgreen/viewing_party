class MovieDetail < Movie
  attr_reader :runtime, :overview, :genres

  def initialize(info)
    super(info)
    @runtime = info[:runtime]
    @overview = info[:overview]
    @genres = info[:genres]
    @cast = info[:credits][:cast]
    @reviews = info[:reviews][:results]
  end

  def self.parse(movie)
    MovieDetail.new(JSON.parse(movie, symbolize_names: true))
  end
end
