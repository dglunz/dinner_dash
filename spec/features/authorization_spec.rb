require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Application authorization', type: :feature do

  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    it 'cannot access a restricted page' do
      visit users_path
      expect(page).to have_content('Not authorized.')
    end

    it 'cannot checkout a cart to an order' do
      visit cart_items_path
      click_link 'Checkout'
      expect(page).to have_content('You need to be logged in')
    end
  end

  context 'when logged in as a user' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
    end

    it 'can see profile details' do
      visit user_path(user.id)
      expect(page).to have_content(user.name)
    end

    it 'can checkout a cart to an order' do
      visit cart_items_path
      click_link 'Checkout'
      click_button 'Submit Order'
      expect(page).to have_content('Select Payment Method')
    end

    it 'cannot go to the admin page' do
      visit admin_path
      expect(page).to have_content('Not authorized')
      expect(page).to_not have_content('Admin Dashboard')
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

  context 'as wrong user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:wrong_user) { FactoryGirl.create(:user, email: 'wrong@example.com') }

    it 'cannot visit another users page' do
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      visit users_path(wrong_user.id)
      expect(page).not_to have_content('Edit')
    end
  end
end

