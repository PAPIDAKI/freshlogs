class ConvertShiftListToSti < ActiveRecord::Migration
  def up
  	add_column :shift_lists ,:type,:string
  end

  def down

  end
end
