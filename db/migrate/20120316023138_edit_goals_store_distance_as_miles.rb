class EditGoalsStoreDistanceAsMiles < ActiveRecord::Migration
  def up
    remove_column :goals, :distance
    remove_column :goals, :distance_unit
    add_column :goals, :miles, :decimal
  end

  def down
    add_column :goals, :distance, :integer
    add_column :goals, :distance_unit, :string
    remove_column :goals, :miles
  end
end
