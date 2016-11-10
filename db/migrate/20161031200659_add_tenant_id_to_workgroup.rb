class AddTenantIdToWorkgroup < ActiveRecord::Migration
  def up
   add_column  :workgroups ,:tenant_id,:integer 
  end
end
