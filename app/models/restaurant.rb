class Restaurant < ActiveRecord::Base
  attr_accessible :restaurant_name, :vegetarian_id
  has_many :restaurant_dishes
  has_many :dishes, :through => :restaurant_dish

  def self.restaurant_call(name)

		menu_info = HTTParty.get("http://api.locu.com/v1_0/menu_item/search/?name=#{name}&api_key=5cd80b5fc715a0ca9f3b450ac925ef8f8a8316b7")

		("http://api.locu.com/v1_0/venue/{venue Locu id}/?api_key=5cd80b5fc715a0ca9f3b450ac925ef8f8a8316b7")
		dishes = []

		menu_info["objects"].each do |u|
			d = Dish.new

			d.name = u['name']
			d.description = u['description']
			d.price = u['price']

			dishes << d
	end
end
