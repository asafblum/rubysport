class AddAddressMetaToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :zip, :string
    add_column :locations, :city, :string
    add_column :locations, :country, :string
  end
end
