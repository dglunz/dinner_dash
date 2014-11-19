class Item < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :title, uniqueness: true, presence: true
  validates :description, :categories, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }, format: { with: /\d+(\.\d{1,2})?/ }
  has_attached_file :photo
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
