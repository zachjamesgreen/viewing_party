require 'rails_helper'

RSpec.describe 'Movies Index/Discover' do
  context 'has content' do
    it 'has form with search box' do
      # TODO authenticate user
      visit discover_path
      expect(page).to have_field 'search'
    end
  end
end