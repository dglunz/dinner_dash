require 'rails_helper'

RSpec.describe Address, :type => :model do
  let(:address) do
    Address.new(street_name: "Death Street", street_number: "8000",
                city: "Beverly Hills", state: "CA", zip_code: "90210",
                order_id: 1)
  end

  it 'is valid' do 
    expect(address).to be_valid
  end

  it 'is invalid without a street name' do 
    address.street_name = nil
    expect(address).not_to be_valid
  end

  it 'is invalid without a street number' do 
    address.street_number = nil
    expect(address).not_to be_valid
  end

  it 'is invalid without a city' do 
    address.city = nil
    expect(address).not_to be_valid
  end

  it 'is invalid without a state' do 
    address.state = nil
    expect(address).not_to be_valid
  end

  it 'is invalid without a zip code' do 
    address.zip_code = nil
    expect(address).not_to be_valid
  end

  it 'is invalid without an order id' do 
    address.order_id = nil
    expect(address).not_to be_valid
  end
end
