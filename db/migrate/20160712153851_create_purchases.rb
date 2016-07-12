class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.float :price
      t.string :note
      t.integer :tenant_id
      t.integer :pmu_id

      t.timestamps null: false
    end
  end
end
