class EditMilesColumnsChangeToFloats < ActiveRecord::Migration
  def up
    change_column :goals, :miles, :float
    change_column :jogs, :miles, :float
  end

  def down
    change_column :goals, :miles, :decimal
    change_column :jogs, :miles, :decimal
  end
end
