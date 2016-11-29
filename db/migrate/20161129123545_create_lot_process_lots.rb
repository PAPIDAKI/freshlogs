class CreateLotProcessLots < ActiveRecord::Migration
  def change
    create_table :lot_process_lots do |t|
      t.integer :lot_id
      t.integer :process_lot_id

      t.timestamps null: false
    end
  end
end
