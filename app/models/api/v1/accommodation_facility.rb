class API::V1::AccommodationFacility < ApplicationRecord
  has_and_belongs_to_many :api_v1_accommodations
end
