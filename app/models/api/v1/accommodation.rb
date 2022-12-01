class API::V1::Accommodation < ApplicationRecord
  enum type_of_hotel: [:hotel, :hostel, :apparthotel]

  has_many :api_v1_rentals
end
