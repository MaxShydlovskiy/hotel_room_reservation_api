class CreateApiV1Accommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_accommodations do |t|
      t.text :description

      t.timestamps
    end
  end
end
