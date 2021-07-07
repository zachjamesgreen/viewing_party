class MovieDetail < Movie
  attr_reader :runtime, :overview, :genres

  def initialize(info)
    super(info)
    @runtime = info[:runtime]
    @overview = info[:overview]
    @genres = info[:genres]
    @cast = info[:credits][:cast]
    @reviews = info[:reviews]
  end
end
