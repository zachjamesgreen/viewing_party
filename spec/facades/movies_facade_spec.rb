require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'movies_discover' do
    it 'creates movies' do
      VCR.use_cassette('facade_discover', :record => :new_episodes) do
        movies = MoviesFacade.discover

        expect(movies.first).is_a? Movie
        expect(movies.count).to eq 20
        movies.each do |movie|
          expect(movie).is_a? Movie
          expect(movie.id).is_a? Integer
          expect(movie.poster_path).is_a? String
          expect(movie.title).is_a? String
          expect(movie.image_base_url).to eq 'https://image.tmdb.org/t/p/'
          expect(movie.vote_average).is_a? Integer
        end
      end
    end
  end
end