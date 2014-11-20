require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:order) do 
    Order.new(delivery: true)
  end

  it 'is valid' do 
    expect(order).to be_valid
  end

  it 'is invalid without a delivery status' do 
    order.delivery = nil
    expect(order).to_not be_valid
  end

end
