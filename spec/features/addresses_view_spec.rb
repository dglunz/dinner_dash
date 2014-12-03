require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the addresses view', type: :feature do
  let(:addresses) { [Address.create(street_name: "Bad Street", street_number: "8000",
                                  city: "Beverly Hills", state: "CA", zip_code: "90210"),
                    Address.create(street_name: "Good Street", street_number: "8000",
                                  city: "Beverly Hills", state: "CA", zip_code: "90210")]
                                   }

  let(:admin) { FactoryGirl.create(:admin) }

  before(:each) do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Login'
    visit addresses_path(addresses)
  end

  it "shows the addresses" do
    expect(page).to have_content(addresses.first.street_name)
  end

  it "has a link to add a new address" do
    expect(page).to have_link("New Address", href: new_address_path)
  end

  it "adds a new address" do
    page.click_link("New Address")
    page.fill_in("Street name", with: "Stupid Street")
    page.fill_in("Street number", with: "1000")
    page.fill_in("City", with: "Philadelphia")
    page.fill_in("State", with: "PA")
    page.fill_in("Zip code", with: "19089")
    page.click_button("Submit")
    expect(page).to have_content("19089")
  end

  it "has links to edit addresses" do
    addresses.each do |address|
      expect(page).to have_link("Edit", href: edit_address_path(address))
    end
  end

  it "edits an address" do
    address = addresses.first
    old_street = address.street_name

    first(:link, "Edit").click
    page.fill_in("Street name", with: "Awesome street")
    page.click_button("Submit")
    expect(current_path).to eq(address_path(address))
    expect(page).to have_content("Awesome street")
    expect(page).to_not have_content(old_street)
  end

  xit "has links to delete addresses" do
    addresses.each do |address|
      expect(page).to have_link("Destroy")
    end
  end

  xit "deletes an address" do
    page.click_link("New Address")
    page.fill_in("Street name", with: "Happy Street")
    page.fill_in("Street number", with: "1000")
    page.fill_in("City", with: "Philadelphia")
    page.fill_in("State", with: "PA")
    page.fill_in("Zip code", with: "19089")
    page.click_button("Submit")
    expect(page).to have_content("19089")

    click_on("Back")
    all("#delete").last.click
    expect(current_path).to eq(addresses_path)
    expect(page).to_not have_content("Happy Street")
  end
end

