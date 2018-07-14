class AddStartedEndedProductivityColumnsToAttendance < ActiveRecord::Migration
  def up
   add_column :attendances,:hours_worked,:float
   add_column :attendances,:extra_time,:float
   add_column :attendances,:productivity,:integer
  end

  def down 
  remove_column :attendances,:hours_worked
  remove_column :attendances,:extra_time
  remove_column :attendances,:productivity
  end
end
