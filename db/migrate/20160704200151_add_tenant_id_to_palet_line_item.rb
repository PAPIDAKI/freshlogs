class AddTenantIdToPaletLineItem < ActiveRecord::Migration
  def change
    add_column :palet_line_items,:tenant_id,:integer
  end
end
