class AddGoalIdToJogs < ActiveRecord::Migration
  def change
    add_column :jogs, :goal_id, :integer
  end
end
