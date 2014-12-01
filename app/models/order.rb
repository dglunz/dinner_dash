class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address

  validates_inclusion_of :delivery, :in => [true, false]
  validates_inclusion_of :pending, :in => [true, false]

  def status
    "pending" if pending
  end
end
