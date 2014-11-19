require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the addresses view', type: :feature do 
  let(:addresses) { [Address.create(street_name: "Bad Street", street_number: "8000",
                                  city: "Beverly Hills", state: "CA", zip_code: "90210"),
                    Address.create(street_name: "Bad Street", street_number: "8000",
                                  city: "Beverly Hills", state: "CA", zip_code: "90210")]
                                   }

  before(:each) do 
    visit addresses_path(addresses)
  end

  it "shows the addresses" do
    expect(page).to have_content(addresses.first.street_name)
  end

  it "has a link to add a new address" do
    expect(page).to have_link("New Address", href: new_address_path) 
  end

  # it 'shows the orders' do
  #   addresses.orders.each do |order|
  #     expect(page).to have_content(address.order)
  #   end
  # end

  # it 'has a link to add a new order' do 
  #   expect(page).to have_link("New order", href: new_order_path(address_id: address.id))
  # end

  # it 'adds a new order' do
  #   page.click_link("New order")
  #   page.click_button("Create order")
  #   expect(current_path).to eq(address_path(address))
  # end

  # it 'has links to edit order' do
  #   address.orders.each do |order|
  #     expect(page).to have_link('edit', href: edit_order_path(order))
  #   end
  # end

  # it 'edits an order' do
  #   new_order = address.orders.first
  #   old_order = new_order.order

  #   first(:link, 'edit').click 
  #   page.click_button('Update order')
  #   expect(current_path).to eq(address_path(address))
  #   expect(page).to have_content('')
  #   expect(page).to_not have_content('')
  # end

  # it 'deletes an order' do
  #   first(:link, 'delete').click
  #   expect(current_path).to eq(address_path(address))
  #   expect(page).to_not have_content("")
  # end

end

