class ChangeColumnLots < ActiveRecord::Migration
  def up
  	change_column :lots,:kg,:integer,default: 0
  	change_column :purchases,:price,:float,default: 0
  end
end
