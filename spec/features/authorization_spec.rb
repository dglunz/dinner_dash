require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Application authorization', type: :feature do

  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    it 'cannot access a restricted page' do
      user = FactoryGirl.create(:user)
      visit users_path
      expect(page).to have_content('Not authorized.')
    end
  end

  context 'when logged in as a user' do

    it 'can see profile details' do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      visit user_path(user.id)
      expect(page).to have_content(user.name)
    end
  end

  context 'when logged in as an admin' do
    it 'can access the users index page' do
      user = FactoryGirl.create(:admin)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      visit users_path
      expect(page).to have_content('All users')
    end
  end
end
