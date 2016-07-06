class AddTenantIdToPalet < ActiveRecord::Migration
  def change
    add_column :palets,:tenant_id ,:integer 
  end
end
