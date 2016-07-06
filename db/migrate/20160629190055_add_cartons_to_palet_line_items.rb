class AddCartonsToPaletLineItems < ActiveRecord::Migration
  def change
    add_column :palet_line_items ,:cartons,:integer

  end
end
