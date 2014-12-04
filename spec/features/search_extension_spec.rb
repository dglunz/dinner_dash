require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Search Extensions', type: :feature do

  context 'when viewing the menu page' do
    before(:each) do
      visit items_path
    end

    it 'has a search button' do
      expect(page).to have_button('search')
    end

    it 'returns no results for a nonsense search' do
      find(:xpath, "//input[@name='title']").set "my value"'puppies'
      click_button 'search'
      expect(page).not_to have_content('puppies')
    end
  end
end
