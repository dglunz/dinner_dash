class Seed
  def initialize
    generate_users
    generate_addresses
    generate_categories
    generate_drink_items
    generate_eat_items
  end

  def generate_users
    puts 'Adding users 1 through 4'
    User.create(name: 'Rachel Warbelow',
                email: 'demo+rachel@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: '',
                admin: false)

    User.create(name: 'Jeff',
                email: 'demo+jeff@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'j3',
                admin: false)

    User.create(name: 'Jorge Tellez',
                email: 'demo+jorge@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'novohispano',
                admin: false)

    User.create(name: 'Josh Cheek',
                email: 'demo+josh@jumpstartlab.com',
                password: 'password',
                password_confirmation: 'password',
                display_name: 'josh',
                admin: true)
  end

  def generate_categories
    puts "Adding categories: ['drinks', 'eats']"
    Category.create(name: 'drinks')
    Category.create(name: 'eats')
  end

  def generate_addresses
    4.times do |i|
      address = Address.create!(
        street_number: Faker::Address.building_number,
        street_name: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip_code: Faker::Address.zip,
        user_id: i
        )
      puts "Added address for user #{i+1}"
    end
  end

  def generate_drink_items
    5.times do |i|
      item = Item.create!(
        title: "#{%w(Single Double Triple Decaf Tea).sample} " +
               "#{%w(Latte Cappuccino Latte Macchiato Americano Espresso).sample} " +
               "#{i+1}",
        description: 'A classic coffee drink made with real craftsmanship',
        price: Faker::Commerce.price,
        photo_file_name: nil,
        photo_content_type: 'image/png',
        photo_file_size: Faker::Number.number(3),
        photo_updated_at: Faker::Date.between(1.week.ago, Date.today),
        categories: [Category.first]
        )
      puts "Added drink item #{i+1}"
    end
  end

  def generate_eat_items
    5.times do |i|
      item = Item.create!(
        title: "#{%w(Vanilla Strawberry Mocha Amaretto Lemon).sample} " +
               "#{%w(Crepe Souffle Tarte Savarin Brulee Croissant).sample} " +
               "#{i+1}",
        description: 'A classic coffee drink made with real craftsmanship',
        price: Faker::Commerce.price,
        photo_file_name: nil,
        photo_content_type: 'image/png',
        photo_file_size: Faker::Number.number(3),
        photo_updated_at: Faker::Date.between(1.week.ago, Date.today),
        categories: [Category.last]
        )
      puts "Added eat item #{i+1}"
    end
  end
end

Seed.new
