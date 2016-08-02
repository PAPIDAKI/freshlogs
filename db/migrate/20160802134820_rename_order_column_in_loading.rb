class RenameOrderColumnInLoading < ActiveRecord::Migration
  def change
  	rename_column :loadings,:order,:order_no
  end
end
