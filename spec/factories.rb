FactoryGirl.define do
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

  end
end
