# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Booking.destroy_all
Service.destroy_all
User.destroy_all

puts 'Creating users...'

# <-- SEED DEMO -->

url = 'http://res.cloudinary.com/dwa3usnol/image/upload/v1519384644/Pierre.jpg'
user = User.new(
first_name: 'Pierre',
last_name: 'Dr Girbau',
role: 'beneficiary',
email: 'homeless@gmail.com',
password: '123456'
)
user.remote_photo_url = url
user.save!

url = 'http://res.cloudinary.com/dwa3usnol/image/upload/v1519383411/Damien.png'
provider = User.new(
first_name: 'Damien',
last_name: 'Daube',
role: 'provider',
email: 'damien.daube@gmail.com',
password: '123456'
)
provider.remote_photo_url = url
provider.save!

url = 'http://res.cloudinary.com/dwa3usnol/image/upload/v1519383411/Noam.png'
provider1 = User.new(
first_name: 'Maxime',
last_name: 'Lima',
role: 'provider',
email: 'maxime.lima@gmail.com',
password: '123456'
)
provider.remote_photo_url = url
provider1.save!

url = 'http://res.cloudinary.com/dwa3usnol/image/upload/v1519383411/Noam.png'
provider1 = User.new(
first_name: 'jean',
last_name: 'Dupras',
role: 'provider',
email: 'jean.dupras@gmail.com',
password: '123456'
)
provider.remote_photo_url = url
provider1.save!

15.times do
User.new(
first_name: Faker::Name.first_name,
last_name: Faker::Name.last_name,
role: 'provider',
email: Faker::Internet.email,
password: '123456'
).save!
end

puts 'Creating services...'


service = Service.new(
    category: 'See a doctor',
    address: '10 rue saint maur, Paris',
    price: 0,
    user_id: 2,
    )
service.save!
  puts "DONE"

service1 = Service.new(
    category: 'See a doctor',
    address: '11 rue Duranti, 75011 Paris',
    price: 0,
    user_id: rand(2..15),
    )
service1.save!
  puts "DONE"

service2 = Service.new(
  category: 'See a doctor',
  address: '10 villa gaudelet, 75011 Paris',
  price: 0,
  user_id: rand(2..15),
  )
service2.save!
puts "DONE"

20.times do
  Service.new(
    category: ['Get assistance', 'Find a room', 'Eat some food', 'Have a shower', 'Get a haircut'].sample,
    address: Faker::Address.street_address,
    price: rand(100),
    user_id: rand(2..15),
    ).save!
  puts "DONE"
end

puts 'Creating bookings...'



puts 'Finished!'
