class ChangeWorkersToSti < ActiveRecord::Migration
  def up
  	remove_column :workers,:last_name
  	remove_column :workers,:first_name
  	remove_column :workers,:course_id
  	remove_column :workers,:w_id
  	add_column :workers,:name,:string
  	add_column :workers,:type,:string
  	remove_column :workers,:age
  	add_column :workers,:birthday,:date
  	add_column :workers,:photo,:string
  end
end
