# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.find_or_create_by(email: 'test@test.com')
u2 = User.find_or_create_by(email: 'test1@test.com')
u3 = User.find_or_create_by(email: 'test2@test.com')
u4 = User.find_or_create_by(email: 'test3@test.com')

type = [:hotel, :apparthotel, :hostel]
town_uk = [:London, :Liverpool, :Cardiff, :Manchester, :Glasgow]

uk = 1
until uk == 101 do
  API::V1::Accommodation.create(
    type_of_hotel: type.shuffle.first,
    country: 'United Kingdom',
    street: 'Test streest',
    city: town_uk.shuffle.first,
    phone_number: '12345678',
    description: 'Test Description for United Kingdom'
  )

  uk += 1
end

town_usa = [:LA, :Washington, :New_York, :Chicago, :San_Francisco, :Seattle]
us = 1
until us == 101 do
  API::V1::Accommodation.create(
    type_of_hotel: type.shuffle.first,
    country: 'USA',
    street: 'Test streest',
    city: town_usa.shuffle.first,
    phone_number: '12345678',
    description: 'Test Description for USA'
    )
  us += 1
end

stat = [:free, :reserved, :archived]
rent = 1
until rent == 101
  API::V1::Rental.create(
    status: stat.shuffle.first,
    user_id: rand(1..4),
    api_v1_accommodation_id: rand(1..100),
    reserve_day: rand((Date.today - 3.month)..Date.today)
  )
  rent += 1
end
