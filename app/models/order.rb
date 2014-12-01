class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address

  has_and_belongs_to_many :items

  validates_inclusion_of :delivery, :in => [true, false]
  validates_inclusion_of :pending, :in => [true, false]

  def status
    "pending" if pending
  end

  def quantity(item)
    items.count(item)
  end

  def unique_items
    items.uniq
  end
end
