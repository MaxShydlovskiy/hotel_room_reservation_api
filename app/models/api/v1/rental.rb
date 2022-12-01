class API::V1::Rental < ApplicationRecord
  enum status: [:free, :reserved, :archived]
  belongs_to :user
  belongs_to :api_v1_accommodation, foreign_key: :api_v1_accommodation_id, class_name: 'Accommodation'
end
