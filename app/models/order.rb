class Order < ActiveRecord::Base
  belongs_to :user
  
  validates :delivery, presence: true
end
