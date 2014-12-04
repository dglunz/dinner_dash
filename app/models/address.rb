class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  rails_admin do
    configure :orders do
      label 'Orders'
    end
  end

end
