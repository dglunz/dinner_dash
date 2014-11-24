# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  name: 'Rachel Warbelow',
  email: 'demo+rachel@jumpstartlab.com',
  password: 'password',
  password_confirmation: 'password',
  display_name: '',
  admin: false
  )

User.create(
  name: 'Jeff',
  email: 'demo+jeff@jumpstartlab.com',
  password: 'password',
  password_confirmation: 'password',
  display_name: 'j3',
  admin: false
  )

User.create(
  name: 'Jorge Tellez',
  email: 'demo+jorge@jumpstartlab.com',
  password: 'password',
  password_confirmation: 'password',
  display_name: 'novohispano',
  admin: false
  )

User.create(
  name: 'Josh Cheek',
  email: 'demo+josh@jumpstartlab.com',
  password: 'password',
  password_confirmation: 'password',
  display_name: 'josh',
  admin: true
  )
