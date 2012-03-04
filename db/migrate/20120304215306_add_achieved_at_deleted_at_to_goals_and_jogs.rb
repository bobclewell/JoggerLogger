class AddAchievedAtDeletedAtToGoalsAndJogs < ActiveRecord::Migration
  def change
    add_column :goals, :achieved_at, :datetime
    add_column :goals, :deleted_at, :datetime
    add_column :jogs, :deleted_at, :datetime
  end
end
