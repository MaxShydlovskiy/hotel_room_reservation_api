# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.create({ email: 'test@test.com', password: '12345', password_confirmation: '12345' })
u2 = User.create({ email: 'test1@test.com', password: '123456', password_confirmation: '123456' })
u3 = User.create({ email: 'test2@test.com', password: '1234567', password_confirmation: '1234567' })
u4 = User.create({ email: 'test3@test.com', password: '12345678', password_confirmation: '12345678' })

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
