class FixAttendancesTable < ActiveRecord::Migration
  def change
  	# t.references :worker, index: true, foreign_key: true
  	add_column :attendances ,:worker_id,:integer,index: true
  end
end
