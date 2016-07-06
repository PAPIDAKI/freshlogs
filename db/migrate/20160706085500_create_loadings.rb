class CreateLoadings < ActiveRecord::Migration
  def change
    create_table :loadings do |t|
      t.datetime :date
      t.string :customer
      t.date :eta
      t.boolean :delivered

      t.timestamps null: false
    end
  end
end
