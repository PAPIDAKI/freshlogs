class RenameOrderColumnInLoading < ActiveRecord::Migration
  def change
  	rename_column :loadings,:order,:ref
  end
end
