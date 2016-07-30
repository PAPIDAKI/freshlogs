class ChangeColumnTypeKgInLots < ActiveRecord::Migration
  def change
  	change_column :lots,:kg,:integer
  end
end
