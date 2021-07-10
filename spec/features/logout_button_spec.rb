require 'rails_helper'

RSpec.describe "Logout Button", type: :feature do
  before :all do
    @user = create(:user)
  end

  def login
    visit '/login'
    fill_in :username, with: @user.username
    fill_in :password, with: @user.username
    click_on 'commit'
  end

  it "should be present on every page" do
    visit root_path
    expect(page).to have_link("Login")
    expect(page).to have_no_link("Log out")
    login
    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_link("Log Out")
    visit root_path
    expect(page).to have_link("Log Out")
    visit movie_path(508943)
    expect(page).to have_link("Log Out")
    visit movies_path
    expect(page).to have_link("Log Out")
    visit discover_path
    expect(page).to have_link("Log Out")
  end
end