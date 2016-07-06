class CreateLooseBerries < ActiveRecord::Migration
  def change
    create_table :loose_berries do |t|
      t.integer :purchase_id
      t.integer :tenant_id
      t.float :kg
      t.string :note

      t.timestamps null: false
    end
  end
end
