blass AddColumnTenantIdToLot < ActiveRecord::Migration
  def up
  	add_column :lots,:tenant_id,:integer,index: :true
  end

  def down
  	remove_column :lots,:tenant_id
  end


end
