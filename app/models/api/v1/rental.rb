class Api::V1::Rental < ApplicationRecord
  enum status: [:free, :reserved, :archived]
  belongs_to :user
  belongs_to :accommodation
end
