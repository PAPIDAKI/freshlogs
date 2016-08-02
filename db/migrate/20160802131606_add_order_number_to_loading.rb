class AddOrderNumberToLoading < ActiveRecord::Migration
  def up
  	add_column :loadings,:order,:string
  end
end
