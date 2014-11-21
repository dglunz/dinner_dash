class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  
  validates :delivery, presence: true
end
