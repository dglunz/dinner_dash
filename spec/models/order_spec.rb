require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) do
    Order.new(delivery: true, pending: false, address: address)
  end

  let(:address) do
    Address.new(street_name: "Death Street", street_number: "8000",
                city: "Beverly Hills", state: "CA", zip_code: "90210")
  end


  it 'is valid' do
    expect(order).to be_valid
  end

  it 'is invalid without a delivery status' do
    order.delivery = nil
    expect(order).to_not be_valid
  end

  it 'is invalid without pending status' do
    order.pending = nil
    expect(order).to_not be_valid
  end

  it 'is invalid if delivery is true but no address selected' do
    order.address = nil
    expect(order).to_not be_valid
  end

  it 'is valid if delivery is false and no address entered' do
    order.address = nil
    order.delivery = false
    expect(order).to be_valid
  end

end
