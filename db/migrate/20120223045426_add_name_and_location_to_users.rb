class AddNameAndLocationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :location, :string
  	add_column :users, :distance_unit, :string
  end
end
