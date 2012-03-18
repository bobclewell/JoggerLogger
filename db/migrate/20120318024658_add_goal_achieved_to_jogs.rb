class AddGoalAchievedToJogs < ActiveRecord::Migration
  def change
    add_column :jogs, :goal_achieved, :boolean
    add_column :jogs, :goal_id_achieved, :integer
  end
end
