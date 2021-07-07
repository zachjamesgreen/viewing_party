class Movie
  attr_reader :id, :poster_path, :vote_average, :title, :runtime, :overview

  def initialize(id:, poster_path:, vote_average:, title:, runtime:, overview:)
    @id = id
    @poster_path = poster_path
    @vote_average = vote_average
    @title = title
    @runtime = runtime
    @overview = overview
  end
end
