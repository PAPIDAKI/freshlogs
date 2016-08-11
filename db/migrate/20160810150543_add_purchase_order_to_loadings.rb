class AddPurchaseOrderToLoadings < ActiveRecord::Migration
  def up
  	add_column :loadings,:purchase_order,:string
  end
end
