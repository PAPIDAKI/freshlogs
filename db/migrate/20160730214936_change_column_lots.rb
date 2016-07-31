class ChangeColumnLots < ActiveRecord::Migration
  def up
  	change_column :lots,:kg,:integer,default: 0
  end
end
