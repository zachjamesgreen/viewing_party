require 'rails_helper'

RSpec.describe TMDBService do
  describe '.search' do
    it 'searches' do
      VCR.use_cassette('moviedb_search', :record => :new_episodes) do
        search = TMDBService.search('fast')

        expect(search[0]).is_a? Movie
        expect(search[0].title).to eq('Fast & Furious 10')
        expect(search.length).to eq(20)
#         expect(search.last.title).to eq('Fast Track: No Limits')
      end
    end
  end

  describe '.top_rated' do
    it 'retrieves top rated' do
      VCR.use_cassette('tmdb_service_top_rated', :record => :new_episodes) do
        top = TMDBService.top_rated(1)
        next_20 = TMDBService.top_rated(2)
        expect(top[0].title).to eq('Dilwale Dulhania Le Jayenge')
        expect(next_20[0].title).to eq('The Lord of the Rings: The Return of the King')
        expect(next_20[0].vote_average).to be < (top[0].vote_average)
        expect(top.length).to eq 20
        expect(next_20.length).to eq 20
      end
    end
  end
end
