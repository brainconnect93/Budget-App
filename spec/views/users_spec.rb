require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Afolabi', email: '123abc@gmail.com', password: '123456')
  end

  describe 'index page' do
    it 'should have a link to create a new user' do
      visit users_path
      expect(page).to have_link('Sign up')
    end

    it 'should have a link to login a user' do
      visit users_path
      expect(page).to have_link('Log in')
    end

    it 'should have the right content' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end
  end
end
