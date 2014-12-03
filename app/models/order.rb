class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address

  has_and_belongs_to_many :items

  validates_inclusion_of :delivery, in: [true, false]
  validates_inclusion_of :pending, in: [true, false]

  validates_presence_of :address, if: :delivery?

  def status
    pending ? 'Pending' : 'Paid'
  end

  def quantity(item)
    items.map(&:id).count(item)
  end

  def unique_items
    items.uniq
  end

  def shipping_address
    delivery ? address.street_name : 'Pick-Up'
  end

  def total
    items.reduce(0){|total, item| total + item.price}
  end

  def stripe_total
    (total * 100).round
  end
end
