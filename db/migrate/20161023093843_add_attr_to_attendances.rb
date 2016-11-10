class AddAttrToAttendances < ActiveRecord::Migration
  def up
  	# add_column :attendances,:position,:string
  	# add_column :attendances,:cartons,:integer
  	remove_column :shift_lists,:course_id
  end
end
