class Address < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :orders

  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

end
