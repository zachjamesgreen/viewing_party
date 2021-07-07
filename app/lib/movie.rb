class Movie
  attr_reader :id, :poster_path, :vote_average, :title

  def initialize(info)
    @id = info[:id]
    @poster_path = info[:poster_path]
    @vote_average = info[:vote_average]
    @title = info[:title]
  end
end
