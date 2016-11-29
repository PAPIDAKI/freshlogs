class CreateProcessLots < ActiveRecord::Migration
  def change
    create_table :process_lots do |t|
      t.datetime :date
      t.string :lot
      t.integer :quantity
      t.string :note

      t.timestamps null: false
    end
  end
end
