class AddGoalAchievedToJogs < ActiveRecord::Migration
  def change
    add_column :jogs, :goal_achieved, :boolean
  end
end
