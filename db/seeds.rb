# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Service.destroy_all
User.destroy_all

puts 'Creating services...'
puts 'Creating users...'

users_attributes = [
  {
    first_name: 'Jean',
    id: 1,
    email:    'damie.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'John',
    id: 2,
    email:    'damien.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Jack',
    id: 3,
    email:    'dami.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Jane',
    id: 4,
    email:    'dam.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Paul',
    id: 5,
    email:    'd.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Luc',
    id: 6,
    email:    'damien.daue@gmail.com',
    password: '123456',
  }
]
User.create!(users_attributes)

services_attributes = [
  {
    category:                'Get assistance',
    user_id:                  1,
  },
  {
    category:                'Find a room',
    user_id:                  2,
  },
  {
    category:                'See a doctor',
    user_id:                  3,
  },
  {
    category:                'Eat some food',
    user_id:                  4,
  },
  {
    category:                'Have a shower',
    user_id:                  5,
  },
  {
    category:                'Get a haircut',
    user_id:                  6,
  }
]

Service.create!(services_attributes)

puts 'Finished! Services have been created!'
