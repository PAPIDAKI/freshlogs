class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :mobile
      t.integer :tenant_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
