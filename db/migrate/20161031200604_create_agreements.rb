class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.string :year
      t.float :payble
      t.string :note
      t.integer :tenant_id

      t.timestamps null: false
    end
  end
end
