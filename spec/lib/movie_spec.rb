require 'rails_helper'

RSpec.describe Movie do
  it 'has attrs' do
    movie = MovieDetail.new({
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
    })

    expect(movie.id).to eq 1
    expect(movie.poster_path).to eq '/qIicLxr7B7gIt5hxZxo423BJLlK.jpg'
    expect(movie.vote_average).to eq 8.2
    expect(movie.title).to eq 'F9'
    expect(movie.runtime).to eq 138
    expect(movie.overview).to eq 'The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is'
  end
end
