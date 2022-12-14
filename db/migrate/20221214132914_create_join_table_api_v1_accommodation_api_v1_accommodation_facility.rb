class CreateJoinTableAPIV1AccommodationAPIV1AccommodationFacility < ActiveRecord::Migration[7.0]
  def change
    create_join_table :api_v1_accommodations, :api_v1_accommodation_facilities do |t|
      # t.index [:api_v1_accommodation_id, :api_v1_accommodation_facility_id]
      # t.index [:api_v1_accommodation_facility_id, :api_v1_accommodation_id]
    end
  end
end
