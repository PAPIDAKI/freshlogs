class Rename < ActiveRecord::Migration
  def up
  	remove_column :crates ,:driver_id
  	add_column :crates,:worker_id,:integer
  end

  def down
  end
end
