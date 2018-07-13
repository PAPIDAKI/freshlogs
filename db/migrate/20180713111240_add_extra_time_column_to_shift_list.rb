class AddExtraTimeColumnToShiftList < ActiveRecord::Migration
  def up
   add_column :shift_lists,:break_time ,:float
  end

  def down
    remove_column :shift_lists,:break_time 
  end 

end
