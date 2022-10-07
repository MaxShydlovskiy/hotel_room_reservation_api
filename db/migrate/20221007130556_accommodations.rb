class Accommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_accommodations, :type_of_hotel, :integer
  end
end
