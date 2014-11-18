require 'rails_helper'

RSpec.describe Address, :type => :model do
  let(:valid_attributes) {
    { street_name: "Bad Street", street_number: "8000", city: "Beverly Hills",
     state: "CA", zip_code: "90210" }
  }
end
