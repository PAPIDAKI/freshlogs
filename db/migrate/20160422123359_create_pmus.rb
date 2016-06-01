class CreatePmus < ActiveRecord::Migration
  def change
    create_table :pmus do |t|
      t.string :produce
      t.string :village
      t.string :location
      t.integer :size
      t.integer :plants
      t.integer :production
      t.string :facilities
      t.string :certification
      t.belongs_to :project, index: true, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
