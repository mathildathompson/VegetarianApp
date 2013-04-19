class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.integer :vegetarian_id

      t.timestamps
    end
  end
end
