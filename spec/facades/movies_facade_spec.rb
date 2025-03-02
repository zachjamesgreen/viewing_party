require 'rails_helper'

RSpec.describe MoviesFacade do
  describe 'discover' do
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

  describe 'search' do
    it 'searches for movies' do
      VCR.use_cassette('facade_search', :record => :new_episodes) do
        movies = MoviesFacade.search('fast')

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

  describe 'top_rated' do
    it 'retrieves top rated' do
      VCR.use_cassette('facade_search', :record => :new_episodes) do
        movies = MoviesFacade.top_rated(1)
        next_20 = MoviesFacade.top_rated(2)

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
        expect(next_20.first).is_a? Movie
        expect(next_20.count).to eq 20
        next_20.each do |movie|
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

  describe 'find' do
    it 'finds movie details by id' do
      VCR.use_cassette('facade_find', :record => :new_episodes) do
        movie_details = MoviesFacade.find(238)

        expect(movie_details).is_a? MovieDetail
        expect(movie_details.runtime).is_a? Integer
        expect(movie_details.overview).is_a? String
        expect(movie_details.genres).is_a? Array
        expect(movie_details.cast).is_a? Array
        expect(movie_details.reviews).is_a? Array
      end
    end
  end
end