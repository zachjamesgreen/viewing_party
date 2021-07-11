require 'rails_helper'

RSpec.describe TMDBService do
  it 'searches' do
    VCR.use_cassette('moviedb_search', :record => :new_episodes) do
      search = TMDBService.search('fast')
      expect(search[0]).is_a? Movie
      expect(search[0].title).to eq('Fast & Furious 10')
      expect(search.length).to eq(20)
      expect(search.last.title).to eq('Fast Track: No Limits')
#       expect(search.last.title).to eq('Fast Girls')
    end
  end
end
