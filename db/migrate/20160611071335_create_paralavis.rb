class CreateParalavis < ActiveRecord::Migration
  def change
    create_table :paralavis do |t|
      t.integer :lot_id
      t.integer :plastics
      t.integer :kgs
      t.string :note
      t.integer :tenant_id
      t.timestamps null: false
    end
  end
end
