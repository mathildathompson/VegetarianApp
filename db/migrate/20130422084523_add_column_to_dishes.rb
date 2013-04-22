class AddColumnToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :city, :string
    add_column :dishes, :street_address, :string
  end
end
