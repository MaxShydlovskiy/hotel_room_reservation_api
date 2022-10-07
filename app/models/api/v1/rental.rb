class Api::V1::Rental < ApplicationRecord
  enum status: [:free, :reserved, :archived]
end
