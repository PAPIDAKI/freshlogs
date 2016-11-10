class AddWorkgroupIdToWorker < ActiveRecord::Migration
  def up
  	add_column :workers,:workgroup_id,:integer,index:true 
  end
end
