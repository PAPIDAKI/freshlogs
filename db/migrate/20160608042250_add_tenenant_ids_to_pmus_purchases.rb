class AddTenenantIdsToPmusPurchases < ActiveRecord::Migration
  def up
  	add_column :pmus,:tenant_id,:integer,:index=>true
  	add_column :purchases,:tenant_id,:integer,:index=>true

  end

  def down
  	remove_column :pmus,:tenant_id
	remove_column :purchases,:tenant_id

  end
end
