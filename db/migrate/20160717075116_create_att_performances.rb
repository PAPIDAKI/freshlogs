class CreateAttPerformances < ActiveRecord::Migration
  def change
    create_table :att_performances do |t|
      t.integer :attendance_id
      t.integer :tenant_id
      t.string :work_position
      t.integer :cartons_packed
      t.datetime :late_arrival
      t.datetime :early_leave

      t.timestamps null: false
    end
  end
end
