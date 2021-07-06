require 'rails_helper'

RSpec.describe 'New User Page' do
  before(:each) do
    visit '/register'
  end

  it 'contains a form to register' do
    expect(page).to have_content('Register as a New User')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[username]')
    expect(page).to have_field('user[password]')
    expect(page).to have_field('user[password_confirmation]')
    expect(page).to have_button('Create User')
  end

  it 'creates a new user' do
    fill_in('user[email]', :with => 'Tim@mail.orb')
    fill_in('user[username]', :with => 'Tim')
    fill_in('user[password]', :with => 'luvshotdogs')
    fill_in('user[password_confirmation]', :with => 'luvshotdogs')
    click_button('Create User')
  end
end
