class Movie
  attr_reader :id, :poster_path, :vote_average, :title, :image_base_url

  def initialize(info)
    @id = info[:id]
    @poster_path = info[:poster_path]
    @vote_average = info[:vote_average]
    @title = info[:title]
    @image_base_url = 'https://image.tmdb.org/t/p/original'
  end
end
