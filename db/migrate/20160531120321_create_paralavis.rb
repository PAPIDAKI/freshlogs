class CreateParalavis < ActiveRecord::Migration
  def change
    create_table :paralavis do |t|

      t.timestamps null: false
    end
  end
end
