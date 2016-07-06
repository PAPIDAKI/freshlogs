class RebuildLotsTable < ActiveRecord::Migration
  def change
    create_table :lots do |t|

      t.integer :purchase_id,index: true
      t.string :lot
      	
      t.timestamps null: false
    end
  end
end
