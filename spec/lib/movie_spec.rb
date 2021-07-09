require 'rails_helper'

RSpec.describe Movie do
  before :all do
    @info = {
      id: 1,
      poster_path: '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg',
      vote_average: 8.2,
      title: 'F9',
      runtime: 138,
      genre: [
        {
          id: 28,
          name: 'Action'
        },
        {
          id: 878,
          name: 'Science Fiction'
        }
      ],
      credits: {},
      reviews: {},
      overview: 'The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is'
    }
    @movie = MovieDetail.new(@info)
  end

  it 'has attrs' do
    expect(@movie.id).to eq 1
    expect(@movie.poster_path).to eq '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg'
    expect(@movie.vote_average).to eq 8.2
    expect(@movie.title).to eq 'F9'
    expect(@movie.runtime).to eq 138
    expect(@movie.overview).to eq 'The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is'
  end

  it 'can parse json and return a MovieDetail' do
    movie = MovieDetail.parse(@info.to_json)
    expect(movie).to be_instance_of(MovieDetail)
    expect(movie.id).to eq @info[:id]
    expect(movie.poster_path).to eq @info[:poster_path]
    expect(movie.vote_average).to eq @info[:vote_average]
    expect(movie.title).to eq @info[:title]
    expect(movie.runtime).to eq @info[:runtime]
    expect(movie.overview).to eq @info[:overview]
  end

  it 'can parse json and return a Movie' do
    movie = Movie.parse(@info.to_json)
    expect(movie).to be_instance_of(Movie)
    expect(movie.id).to eq @info[:id]
    expect(movie.poster_path).to eq @info[:poster_path]
    expect(movie.vote_average).to eq @info[:vote_average]
    expect(movie.title).to eq @info[:title]
    # expect(movie.runtime).to eq @info[:runtime]
    # expect(movie.overview).to eq @info[:overview]
  end
end
