require 'rails_helper'

RSpec.describe 'Movies' do
  context 'discover page' do
    it 'has form with search box' do
      # TODO authenticate user
      visit discover_path
      expect(page).to have_field 'search'
    end
  end

  context 'movies page' do
    it 'has form with search box' do
      # TODO authenticate user
      visit movies_path
      expect(page).to have_field 'search'
    end
  end

  context 'movie details page' do
    it 'has link to create viewing party' do
      # TODO authenticate user
      # TODO make sure to get stubbed data
      visit '/movies/1'
      expect(page).to have_link 'Create Viewing Party'
    end
  end
end