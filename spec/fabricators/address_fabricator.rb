Fabricator(:address) do
  street_number { Faker::Address.building_number }
  street_name { Faker::Address.street_name }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip_code { Faker::Address.zip }
end
