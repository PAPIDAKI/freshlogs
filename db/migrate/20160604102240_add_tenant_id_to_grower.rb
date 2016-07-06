class AddTenantIdToGrower < ActiveRecord::Migration
  def up
  	add_column :growers,:tenant_id,:integer,index: true 
  end
  def down 
  	remove_column :growers,:tenant_id
  end
end
