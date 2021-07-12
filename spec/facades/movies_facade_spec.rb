require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'movies_discover' do
    it 'creates movies' do
      movies = MoviesFacade.movies_discover(1)

      expect(movies.first).is_a? Movie
      movies.each do |movie|
        expect(movie).is_a? Movie
        expect(movie.id).is_a? Integer
        expect(movie.poster_path).is_a? String
        expect(movie.title).is_a? String
      end
    end
  end
end