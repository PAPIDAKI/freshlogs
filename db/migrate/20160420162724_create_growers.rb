class CreateGrowers < ActiveRecord::Migration
  def change
    create_table :growers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :mobile
      t.string :vat
      t.string :picture

      t.timestamps null: false
    end
  end
end
