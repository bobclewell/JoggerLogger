class EditJogsChangeMilesToFloat < ActiveRecord::Migration
  def up
    change_column :jogs, :miles, :decimal, :precision => 6, :scale => 3
  end

  def down
    change_column :jogs, :miles, :integer
  end
end
