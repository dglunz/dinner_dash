class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  
  validates_inclusion_of :delivery, :in => [true, false]
  validates_inclusion_of :pending, :in => [true, false]
end
