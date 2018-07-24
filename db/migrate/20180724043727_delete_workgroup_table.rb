class DeleteWorkgroupTable < ActiveRecord::Migration
  def up
    #drop_table :worker_agreements
    #drop_table :workgroups
    drop_table :workgroup_workers
  end

  def down

  end
end
