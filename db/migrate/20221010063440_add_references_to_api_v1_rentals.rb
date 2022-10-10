class AddReferencesToApiV1Rentals < ActiveRecord::Migration[7.0]
  def change
    add_reference :api_v1_rentals, :api_v1_accommodation, null: false, foreign_key: true
  end
end
