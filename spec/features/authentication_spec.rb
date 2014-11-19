require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Application authentication', type: :feature do

  it 'creates a new user' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: 'Name'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Submit'
    expect(page).to have_content('User created.')
  end

  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    it 'has a login link' do
      expect(page).to have_link('Login', href: login_path)
    end

    it 'has a sign up link' do
      expect(page).to have_link('Sign Up', href: new_user_path)
    end

    it 'does not have a logout link' do
      expect(page).not_to have_link('Logout', href: logout_path)
    end
  end

  context 'when logged in' do

    it 'logs in an existing user' do
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      expect(page).to have_content('Logout')
    end

    it 'does not have a login link' do
      expect(page).not_to have_link('Login', href: login_path)
    end
  end
end
