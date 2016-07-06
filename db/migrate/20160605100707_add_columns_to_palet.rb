class AddColumnsToPalet < ActiveRecord::Migration

  def up
  	add_column :palets,:date,:datetime
  	add_column :palets,:code,:string
  	add_column :palets,:loading_id,:integer
  end

  def down 
  	remove_column :palets,:date
  	remove_column :palets,:code
  	remove_column :palets,:loading_id
  end

end
