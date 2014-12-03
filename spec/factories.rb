FactoryGirl.define do  factory :order do
    delivery false
  end

  factory :user do
    name 'Cave Johnson'
    email 'cave@aperturelabs.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :admin, class: User do
    name 'Admin User'
    email 'admin@aperturelabs.com'
    password 'foobar'
    password_confirmation 'foobar'
    admin true
  end

  factory :address do
    street_number { Faker::Address.building_number }
    street_name { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip }
    user_id 0
  end

  factory :category do
    name 'drinks'
  end

  factory :item do
    title 'Espresso'
    description 'Coffee that has been forcefully brewed with hot water and lots of pressure'
    price 2.99
    categories FactoryGirl.create_list(:category, 1)
  end
end
