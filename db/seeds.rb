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
    last_name: 'Gabin',
    role: 'provider',
    id: 1,
    email:    'damie.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'John',
    last_name: 'Lennon',
    role: 'provider',
    id: 2,
    email:    'damien.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Jack',
    last_name: 'Dawson',
    role: 'provider',
    id: 3,
    email:    'dami.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Jane',
    last_name: 'Birkin',
    role: 'provider',
    id: 4,
    email:    'dam.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Paul',
    last_name: 'Mc Cartney',
    role: 'provider',
    id: 5,
    email:    'd.daube@gmail.com',
    password: '123456',
  },
  {
    first_name: 'Nico',
    last_name: 'SDF1',
    role: 'provider',
    id: 6,
    email:    'sdf1@gmail.com',
    password: '123456',
  },
   {
    first_name: 'Damien',
    last_name: 'SDF2',
    role: 'beneficiary',
    id: 7,
    email:    'sdf2@gmail.com',
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
  },
  {
    category:                'Get assistance',
    user_id:                  5,
  },
]

Service.create!(services_attributes)

bookings_attributes = [
  {
    start_date:               Date.today,
    end_date:                 Date.new(2019, 2, 3),
    status:                   'Confirmed',
    paid:                     true,
    user:                     User.find(3),
    service:                  Service.find(3),

  },
]

Booking.create!(bookings_attributes)

puts 'Finished! Services have been created!'
