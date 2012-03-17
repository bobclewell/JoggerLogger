class AddStartedAtToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :started_at, :datetime
  end
end
