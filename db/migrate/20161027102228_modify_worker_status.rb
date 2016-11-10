class ModifyWorkerStatus < ActiveRecord::Migration
  def up
  	# remove_column :workers,:status
  	add_column :workers,:status,:integer
  end

  def down
  	remove_column :workers,:status
  end
end
