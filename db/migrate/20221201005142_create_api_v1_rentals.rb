class CreateAPIV1Rentals < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_rentals do |t|
      t.integer :status
      t.date :reserve_day

      t.timestamps
    end
  end
end
