class CreateWorkgroups < ActiveRecord::Migration
  def change
    create_table :workgroups do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
