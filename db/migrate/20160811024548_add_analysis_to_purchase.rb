class AddAnalysisToPurchase < ActiveRecord::Migration
  def up
  	add_column :purchases,:analysis,:string
  	remove_column :purchases,:date
  end
end
