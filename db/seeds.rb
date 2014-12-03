class Seed
  def initialize
    generate_users
    generate_addresses
    generate_categories
    generate_items('drink')
    generate_items('eat')
    generate_orders
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
      Address.create!(
        street_number: Faker::Address.building_number,
        street_name: Faker::Address.street_name,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip_code: Faker::Address.zip,
        user_id: i + 1
        )
      puts "Added address for user #{i + 1}"
    end
  end

  def generate_items(type)
    drink1 = %w(Single Double Triple Decaf Tea)
    drink2 = %w(Latte Cappuccino Latte Macchiato Americano Espresso)
    eat1   = %w(Vanilla Strawberry Mocha Amaretto Lemon)
    eat2   = %w(Crepe Souffle Tarte Savarin Brulee Croissant)

    if type == 'drink'
      item1 = drink1
      item2 = drink2
      category = Category.first
    elsif type == 'eat'
      item1 = eat1
      item2 = eat2
      category = Category.last
    end

    5.times do |i|
      Item.create!(
        title: "#{item1.sample} #{item2.sample} #{i + 1}",
        description: 'A classic coffee drink made with real craftsmanship',
        price: Faker::Commerce.price,
        photo_file_name: nil,
        photo_content_type: 'image/png',
        photo_file_size: Faker::Number.number(3),
        photo_updated_at: Faker::Date.between(1.week.ago, Date.today),
        categories: [category]
        )
      puts "Added order #{type} item #{i + 1}"
    end
  end

  def generate_orders
    10.times do |i|
      order = Order.new(user_id: rand(1..4))
      order.delivery = [true, false].sample
      order.address = order.user.addresses.first if order.delivery
      order.items = Item.all.sample(3)
      order.pending = [true, false].sample
      order.save!
      puts "Added #{order.id} for #{order.user.name}"
    end
  end
end

Seed.new
