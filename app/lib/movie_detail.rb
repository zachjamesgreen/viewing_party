class MovieDetail < Movie
  attr_reader :runtime, :overview, :genres, :cast, :reviews

  def initialize(info)
    super(info)
    @runtime = info[:runtime].to_i
    @overview = info[:overview]
    @genres = info[:genres]
    @cast = info[:credits] ? info[:credits][:cast] : info[:cast]
    @reviews = info[:reviews] && info[:reviews][:results] ? info[:reviews][:results] : info[:reviews]
  end

  def self.parse(movie)
    MovieDetail.new(JSON.parse(movie, symbolize_names: true))
  end
end
