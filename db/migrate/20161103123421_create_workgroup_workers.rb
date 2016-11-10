class CreateWorkgroupWorkers < ActiveRecord::Migration
  def change
    create_table :workgroup_workers do |t|
      t.integer :workgroup_id
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
