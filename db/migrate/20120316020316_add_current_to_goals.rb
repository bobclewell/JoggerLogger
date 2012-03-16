class AddCurrentToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :current, :boolean
  end
end
