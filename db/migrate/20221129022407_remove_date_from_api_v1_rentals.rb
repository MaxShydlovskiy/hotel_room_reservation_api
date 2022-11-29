class RemoveDateFromAPIV1Rentals < ActiveRecord::Migration[7.0]
  def change
    remove_column :api_v1_rentals, :date, :datetime
  end
end
