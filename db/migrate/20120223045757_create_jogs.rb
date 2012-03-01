class CreateJogs < ActiveRecord::Migration
  def change
    create_table :jogs do |t|
      t.datetime :jogged_at
      t.integer :seconds
      t.integer :miles
      t.integer :user_id
      t.string :notes

      t.timestamps
    end
  end
end
