class Address < ActiveRecord::Base
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

end
