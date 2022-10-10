class AddDateToApiV1Rentals < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_rentals, :date, :datetime
  end
end
