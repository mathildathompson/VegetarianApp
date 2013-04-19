class RestaurantDish < ActiveRecord::Base
  attr_accessible :dish_id, :restaurant_id
  belongs_to :restaurant
  belongs_to :dish
end
