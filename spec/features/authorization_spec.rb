require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Application authorization', type: :feature do

  context 'when logged out' do
    before(:each) do
      visit root_path
    end

    xit 'cannot access a restricted page' do
      visit edit_user_path
      expect(page).to have_content('Not authorized.')
    end
  end

  context 'when logged in as a user' do

    xit 'can see profile details' do

    end
  end

  context 'when logged in as an admin' do
    xit 'can access the admin page' do

    end
  end
end
