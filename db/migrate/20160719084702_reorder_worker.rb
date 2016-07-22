class ReorderWorker < ActiveRecord::Migration
  def change
  	change_column :workers,:first_name,:string,after: :last_name	
  end
end
