class CreateShiftLists < ActiveRecord::Migration
  def change
    create_table :shift_lists do |t|
      t.integer :course_id
      t.integer :tenant_id
      t.datetime :start_at
      t.datetime :end_at
      t.string :note

      t.timestamps null: false
    end
  end
end
