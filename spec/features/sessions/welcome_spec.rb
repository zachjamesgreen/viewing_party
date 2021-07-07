require 'rails_helper'

RSpec.describe 'Welcome Page' do
  context 'Has content' do
    it 'has button to login' do
      visit '/'
      expect(page).to have_link('Login', href: '/login')
    end

    it 'has button to register' do
      visit '/'
      expect(page).to have_link('Register', href: '/register')
    end
  end
end