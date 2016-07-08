class AddTenantIdToLoading < ActiveRecord::Migration
  def change
    add_column :loadings,:tenant_id,:integer


  end
end
