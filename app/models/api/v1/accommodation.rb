class Api::V1::Accommodation < ApplicationRecord
  enum type_of_hotel: [:hotel, :hostel, :apparthotel]
end
