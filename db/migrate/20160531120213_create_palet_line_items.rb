class CreatePaletLineItems < ActiveRecord::Migration
  def change
    create_table :palet_line_items do |t|

      t.timestamps null: false
    end
  end
end
