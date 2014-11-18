require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:item) { Item.new(valid_attributes) }
  let(:valid_attributes) { {
    title: 'coffee',
    description: 'legal stimulant',
    price: 2.99
  } }

  it 'is valid' do
    expect(item).to be_valid
  end

  it 'is invalid without a title' do
    item.title = nil
    expect(item).to be_invalid
  end

  it 'is invalid without a description' do
    item.description = nil
    expect(item).to be_invalid
  end

  it 'is invalid without a price' do
    item.price = nil
    expect(item).to be_invalid
  end


end
