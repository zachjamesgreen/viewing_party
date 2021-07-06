require 'rails_helper'

RSpec.describe 'New User Page' do
  before(:each) do
    visit '/register'
  end
  it 'contains a form to register' do
    expect(page).to have_content('Register as a New User')
    expect(page).to have_field('username')
    expect(page).to have_field('password')
    expect(page).to have_field('password_confirmation')
    expect(page).to have_button('Save')
  end
end