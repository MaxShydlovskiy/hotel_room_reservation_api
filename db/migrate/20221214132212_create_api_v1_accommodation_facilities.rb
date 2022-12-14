class CreateAPIV1AccommodationFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_accommodation_facilities do |t|
      t.decimal :total_price
      t.decimal :net_price
      t.decimal :iron
      t.decimal :mini_bar
      t.decimal :air_conditioner

      t.timestamps
    end
  end
end
