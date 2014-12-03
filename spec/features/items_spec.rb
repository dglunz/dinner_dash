require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'Item creation', type: :feature do
  around(:each) do |example|
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end

  context 'when logged in as an admin' do
    let(:admin) { FactoryGirl.create(:admin) }
    let(:item)  { FactoryGirl.create(:item) }
    let(:category) { FactoryGirl.create(:category) }

    before(:each) do
      visit login_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Login'
    end

    it 'can add a new item' do
      category.save
      visit new_item_path
      fill_in 'Title', with: 'Coffee'
      fill_in 'Description', with: 'Black gold'
      fill_in 'Price', with: 2.99
      select('drinks', :from => 'category-select')
      click_button 'Submit'

      expect(page).to have_content('Item successfully created!')
    end

    it 'can edit an existing item' do
      item.categories << category
      item.save
      visit items_path
      click_link 'Edit'
      expect(current_path).to eq(edit_item_path(item))
    end
  end
end

