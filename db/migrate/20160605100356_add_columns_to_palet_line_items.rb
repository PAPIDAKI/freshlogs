class AddColumnsToPaletLineItems < ActiveRecord::Migration
  def up
  	add_column :palet_line_items,:palet_id,:integer,:index=>true
  	add_column :palet_line_items,:lot_id,:integer,:index=>true

  end

  def down
  	remove_column :palet_line_items,:palet_id
  	remove_column :palet_line_items,:lot_id
  end
end
