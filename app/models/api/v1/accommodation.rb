class API::V1::Accommodation < ApplicationRecord
  enum type_of_hotel: [:hotel, :hostel, :apparthotel]

  has_many :api_v1_rentals
  has_and_belongs_to_many :api_v1_accommodation_facilities
end
