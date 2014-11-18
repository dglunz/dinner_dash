require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { Category.new(name: 'lunch') }

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category.name = nil
    expect(category).to be_invalid
  end

  it 'associates with a collection of items' do
    item1 = Item.create(title: 'a', description: 'aa', price: 1.99, categories: [category])
    expect(category.items.count).to eq(1)
  end

end
