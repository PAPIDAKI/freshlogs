class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :shift_list, index: true, foreign_key: true
      # t.references :worker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
