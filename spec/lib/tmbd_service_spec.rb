require 'rails_helper'

RSpec.describe TMDBService do
  it 'searches' do
    VCR.use_cassette('moviedb_search', :record => :new_episodes) do
    expect(TMDBService.search('fast')).to eq([])
    end
    
  end
end