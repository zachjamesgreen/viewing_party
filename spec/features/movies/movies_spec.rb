require 'rails_helper'

RSpec.describe 'Movies', :vcr do
  # before :all do
  #   @user_info = {
  #     username: 'ABCDE',
  #     email: 'z@g.com',
  #     password: 'test'
  #   }
  #
  #   @user = User.create @user_info
  # end
  #
  # def login
  #   visit login_path
  #   fill_in :username, with: @user_info[:username]
  #   fill_in :password, with: @user_info[:password]
  #   click_on 'commit'
  # end
  #
  def discover_test
    TMDBService.discover
  end

  context 'discover page', :vcr do
    xit 'should not allow unauth user' do
      visit discover_path
      expect(page).to have_current_path '/login'
    end

    it 'has form with search box' do
      # TODO authenticate user
      visit discover_path
      expect(page).to have_current_path('/discover')
      expect(page).to have_field 'search'
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
      # TODO authenticate user
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

      within 'form' do
        visible = find("input[type=submit][value='Create Viewing Party']").visible?
        expect(visible).to eq true
      end
    end
  end
end
