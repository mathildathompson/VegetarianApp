class Dish < ActiveRecord::Base
  attr_accessible :description, :name, :price
  has_many :restaurant_dishes
  has_many :restaurants, :through => :restaurant_dish

	def self.dish_search(name)
		@dishes = []

		menu_info = HTTParty.get("http://api.locu.com/v1_0/menu_item/search/?name=#{name}&api_key=5cd80b5fc715a0ca9f3b450ac925ef8f8a8316b7")

		menu_info["objects"].each do |u|
			@dishes << Dish.new(:name => u["name"] , :description => u["description"], :price => u["price"])
		end
	end
end