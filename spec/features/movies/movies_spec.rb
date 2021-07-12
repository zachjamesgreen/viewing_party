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
      click_on('Log Out')
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

    it 'has a link to top 40 movies' do
      visit discover_path

      expect(page).to have_link 'Top 40 Movies By Rating'
    end

    it 'clicking the link travels to top rated page' do
      visit discover_path
      click_link 'Top 40 Movies By Rating'

      expect(current_path).to eq('/movies/top_rated')
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

  context 'top_rated page' do
    before(:each) do
      visit top_rated_path
    end
    it 'displays top rated movies' do
      expect(page).to have_content('Average Rating', :count => 40)
    end

    it 'has a search bar' do
      expect(page).to have_field 'Search'
    end

    it 'has a button to log out' do
      expect(page).to have_link 'Log Out'
    end

    it 'each movie title is a link' do
      expect(page).to have_link('The Shawshank Redemption')
      expect(page).to have_link('The Godfather')
    end

    it 'clicking link travels to movie show page' do
      click_link 'The Godfather'

      expect(current_path).to eq('/movies/238')
    end
  end

  context 'movie details page' do
    it 'has link to create viewing party' do
      movie = TMDBService.movie(508943)
      visit '/movies/508943'

      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.vote_average)
      expect(page).to have_content(format_minutes(movie.runtime))
      expect(page).to have_content(movie.overview)
      movie.genres.each do |genre|
        expect(page).to have_content(genre[:name])
      end
      movie.cast[0..9].each do |cast|
        expect(page).to have_content(cast[:name])
        expect(page).to have_content(cast[:character])
      end
      movie.reviews.each do |review|
        expect(page).to have_content(review[:author])
        # expect(page).to have_content(review[:content])
      end


      within 'form' do
        visible = find("input[type=submit][value='Create Viewing Party']").visible?
        expect(visible).to eq true
      end
    end
  end

  context '404 page' do
    it 'has 404 page' do
      visit '/movies/not_found'
      expect(page).to have_content('PAGE NOT FOUND')
    end
  end
end
