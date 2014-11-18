class Item < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }, format: { with: /\d+(\.\d{1,2})?/ }
end
