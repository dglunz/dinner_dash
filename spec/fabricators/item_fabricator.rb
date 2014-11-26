Fabricator(:drinks, from: :item) do
  title { %w(Single Double Triple Decaf Tea).sample + ' ' +
          %w(Latte Cappuccino Latte Macchiato Americano Espresso).sample +
          " #{rand(10)}"}
  description { 'A classic coffee drink made with real craftsmanship'}
  price { Faker::Commerce.price }
  photo_file_name { 'default.png' }
  photo_content_type { %w(image/jpg image/jpeg image/png image/gif).sample }
  photo_file_size { Faker::Number.number(3) }
  photo_updated_at { Faker::Date.between(1.week.ago, Date.today) }
  categories(count: 1){ Fabricate(:category, name: 'drinks') }
end

Fabricator(:eats, from: :item) do
  title { %w(Vanilla Strawberry Mocha Amaretto Lemon).sample + ' ' +
          %w(Crepe Souffle Tarte Savarin Brulee Croissant).sample }
  description { 'Comfort food to soothe the stomach and the soul'}
  price { Faker::Commerce.price }
  photo_file_name { 'default.png' }
  photo_content_type { %w(image/jpg image/jpeg image/png image/gif).sample }
  photo_file_size { Faker::Number.number(3) }
  photo_updated_at { Faker::Date.between(1.week.ago, Date.today) }
  categories(count: 1) { Fabricate(:category, name: 'eats') }
end
