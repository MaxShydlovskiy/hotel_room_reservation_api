class Api::V1::Rental < ApplicationRecord
  enum status: [:free, :reserved, :archived]
  belongs_to :user
  belongs_to :accommodation
  before_create :check_date_uniqueness

  def check_date_uniqueness
    if Api::V1::Rental.where(:datetime => self.datetime.to_date.beginning_of_day..self.datetime.to_date.end_of_day).exists?
      return false
    else
      return true
    end
  end
end
