class API::V1::Rental < ApplicationRecord
  # enum status: [:free, :reserved, :archived]
  belongs_to :user
  belongs_to :accommodation, foreign_key: :api_v1_accommodation_id
  before_create :check_date_uniqueness

  def check_date_uniqueness
    if API::V1::Rental.where(:datetime => self.datetime.to_date.beginning_of_day..self.datetime.to_date.end_of_day).exists?
      return false
    else
      return true
    end
  end

  # default_scope { order("updated_at DESC") }
  scope :filter_by_status, -> (status) { where status: ['free', 'reserved', 'archived']}
  # scope :filter_by_accommodation, -> (accommodation_id) { where accommodation_id: accommodation_id}

  scope :filter_by_datetime, -> (datetime) { where("DATE(datetime) = ?", daytime.to_date)}
end
