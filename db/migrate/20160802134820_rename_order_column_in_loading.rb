class RenameOrderColumnInLoading < ActiveRecord::Migration
  def change
  	rename_column :loadings,:order,:ref
  	remove_column :loadings,:ref
  	add_column :loadings,:ref,:string
  end
end
