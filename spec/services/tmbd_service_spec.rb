require 'rails_helper'

RSpec.describe TMDBService do
  describe '.discover' do
    it 'returns a json response' do
      VCR.use_cassette('moviedb_discover', :record => :new_episodes) do
        body = TMDBService.discover
        discover_array = body[:results]

        expect(body).is_a? Hash
        expect(discover_array).is_a? Array
        expect(discover_array.length).to eq 20
        expect(discover_array.first[:genre_ids]).is_a? Array
        expect(discover_array.first[:title]).is_a? String
      end
    end
  end

  describe '.search' do
    it 'searches' do
      VCR.use_cassette('moviedb_search', :record => :new_episodes) do
        body = TMDBService.search('fast')
        search_array = body[:results]

        expect(body).is_a? Hash
        expect(search_array).is_a? Array
        expect(search_array.length).to eq 20
        expect(search_array.first[:genre_ids]).is_a? Array
        expect(search_array.first[:title]).is_a? String
      end
    end
  end

  describe '.top_rated' do
    it 'retrieves top rated' do
      VCR.use_cassette('tmdb_service_top_rated', :record => :new_episodes) do
        body = TMDBService.top_rated(1)
        body_2 = TMDBService.top_rated(2)
        top_20 = body[:results]
        next_20 = body[:results]

        expect(body).is_a? Hash
        expect(top_20).is_a? Array
        expect(top_20.length).to eq 20
        expect(top_20.first[:genre_ids]).is_a? Array
        expect(top_20.first[:title]).is_a? String
        expect(next_20).is_a? Array
        expect(next_20.length).to eq 20
        expect(next_20.first[:genre_ids]).is_a? Array
        expect(next_20.first[:title]).is_a? String
      end
    end
  end

  describe ''
end
