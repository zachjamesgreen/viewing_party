require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context 'Has content' do
    it 'has button to login' do
      visit '/'
      # TODO: Make sure to add link url to test
      expect(page).to have_link('Login')
    end

    it 'has button to register' do
      visit '/'
      # TODO: Make sure to add link url to test
      expect(page).to have_link('Register')
    end
  end
end