require 'rails_helper'

RSpec.describe 'Movies', :vcr do
  before(:each)do
    User.destroy_all
    @user = User.create!(username: 'ABCDE', email: 'z@g.com', password: 'test')
    visit login_path
    fill_in :username, with: @user.username
    fill_in :password, with: @user.password
    click_button('Submit')
  end

  def discover_test
    TMDBService.discover
  end

  context 'discover page' do
    it 'should not allow unauth user' do 
      visit discover_path
      click_button('Log Out')
      visit discover_path
      expect(page).to have_current_path '/login'
      expect(page).to have_content('You must be logged in to access this section')
    end

    it 'has form with search box' do
      visit discover_path
      expect(page).to have_current_path('/discover')
      expect(page).to have_field 'search'
    end

    it 'searching redirects to movies page' do
      visit discover_path
      fill_in :search, with: 'fast'
      click_button('Search')

      expect(current_path).to eq('/movies')
    end

    it 'has all info' do
      visit discover_path
      movies = discover_test
      expect(movies).is_a?(Array)
      4.times do |idx|
        expect(movies[idx]).to be_instance_of(Movie)
        expect(page).to have_content(movies[idx].title)
        expect(page).to have_content("Average Rating: #{movies[idx].vote_average}")
        img_id = "##{movies[idx].id}-image"
        expect(page.find(img_id)['src']).to have_content("#{movies[idx].image_base_url}w342#{movies[idx].poster_path}")
      end
      expect(page.all('.movie').size).to eq 4
    end
  end

  context 'movies page' do
    it 'has form with search box' do
      visit movies_path
      expect(page).to have_current_path('/movies')
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
