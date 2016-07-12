class CreatePurs < ActiveRecord::Migration
  def change
    create_table :purs do |t|
      t.float :price
      t.string :unit
      t.string :note
      t.integer :pmu_id
      t.integer :tenant_id

      t.timestamps null: false
    end
  end
end
