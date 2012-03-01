class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :goal_type
      t.integer :time
      t.string :time_unit
      t.integer :distance
      t.string :distance_unit
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
