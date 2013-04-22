class AddRestaurantNameToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :restaurant_name, :string
  end
end
