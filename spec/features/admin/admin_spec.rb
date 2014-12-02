require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the admin page', type: :feature do
  let(:admin) { FactoryGirl.create(:admin) }

  before do
    visit root_path
  end

  context 'when logged in' do
    before do
      click_link 'Login'
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Login'
    end

    describe 'admin link' do
      it 'should be visible' do
        expect(page).to have_link('Admin')
      end

      it 'takes me to the admin page' do
        click_link 'Admin'
        expect(page).to have_text('Admin Dashboard')
      end
    end
  end

end
