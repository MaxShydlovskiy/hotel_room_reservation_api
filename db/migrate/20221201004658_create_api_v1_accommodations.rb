class CreateAPIV1Accommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_accommodations do |t|
      t.integer :type_of_hotel
      t.string :country
      t.string :city
      t.string :phone_number
      t.string :description

      t.timestamps
    end
  end
end
