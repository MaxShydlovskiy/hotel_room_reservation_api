class AddAddressToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :api_v1_accommodations, :country, :string
    add_column :api_v1_accommodations, :city, :string
    add_column :api_v1_accommodations, :street, :string
    add_column :api_v1_accommodations, :phone_number, :string
  end
end
