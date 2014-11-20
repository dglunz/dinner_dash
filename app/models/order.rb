class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :addresses
  
  validates :delivery, presence: true
end
