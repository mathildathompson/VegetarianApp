class Dish < ActiveRecord::Base
  attr_accessible :description, :name, :price, :city, :street_address, :restaurant_name


	def self.dish_search(name, city)

		menu_info = HTTParty.get("http://api.locu.com/v1_0/menu_item/search/?name=#{name}&locality=#{city}&api_key=5cd80b5fc715a0ca9f3b450ac925ef8f8a8316b7")

		dishes = []

		menu_info["objects"].each do |u|
			d = Dish.new
			
			d.name = u['name']
			d.restaurant_name = u['venue']['name']
			d.description = u['description']
			d.price = u['price']
			d.street_address = u['venue']['street_address']

			dishes << d

		end
		dishes

	end
end