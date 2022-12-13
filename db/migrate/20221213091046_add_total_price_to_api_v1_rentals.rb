class AddTotalPriceToAPIV1Rentals < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_rentals, :total_price, :decimal, precision: 8, scale: 2
  end
end
