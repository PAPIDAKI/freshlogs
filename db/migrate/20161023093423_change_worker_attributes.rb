class ChangeWorkerAttributes < ActiveRecord::Migration
  def up
  	# remove_column :workers,:active
  	remove_column :workers,:startus
  	add_column :workers,:status,:string
  end
end