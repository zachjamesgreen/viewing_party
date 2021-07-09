require 'rails_helper'

RSpec.describe 'Login page' do
  before(:each) do
    User.destroy_all
  end
  context 'has content' do
    it 'has form' do
      visit '/login'
      within 'form' do
        expect(page).to have_field(name: 'username')
        expect(page).to have_field(name: 'password')
        expect(page).to have_button(name: 'commit')
      end
    end
  end

  it 'can login with valid credentials' do
    user_info ={
      username: 'ABCDE',
      password: 'test',
      email: 'z@g.com'
    }

    User.create user_info

    visit login_path
    expect(page).to have_current_path('/login')

    fill_in :username, with: user_info[:username]
    fill_in :password, with: user_info[:password]
    click_on 'Submit'

    expect(page).to have_current_path('/dashboard')
  end

  it 'can not login with invalid credentials' do
    user_info ={
      username: 'ABCDE',
      password: 'test',
      email: 'z@g.com'
    }

    User.create user_info

    # Bad username
    visit login_path
    expect(page).to have_current_path('/login')

    fill_in :username, with: 'ABCD'
    fill_in :password, with: user_info[:password]
    click_on 'Submit'

    expect(page).to have_current_path('/login')
    expect(page).to have_content('Sorry your info is not correct')

    # Bad Password
    visit login_path
    expect(page).to have_current_path('/login')

    fill_in :username, with: user_info[:username]
    fill_in :password, with: 'exam'
    click_on 'Submit'

    expect(page).to have_current_path('/login')
    expect(page).to have_content('Sorry your info is not correct')
  end
end