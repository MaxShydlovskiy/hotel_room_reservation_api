class AddReserveDayToAPIV1Rentals < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_rentals, :reserve_day, :date
  end
end
