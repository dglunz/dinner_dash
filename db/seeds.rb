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

Category.create(name: 'drinks')

Category.create(name: 'eats')

4.times { Fabricate(:address) }

# 5.times { Fabricate(:drinks) }
#
# 5.times { Fabricate(:eats) }
