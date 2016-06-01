class CreatePalets < ActiveRecord::Migration
  def change
    create_table :palets do |t|

      t.timestamps null: false
    end
  end
end
