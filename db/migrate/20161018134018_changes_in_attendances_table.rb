class ChangesInAttendancesTable < ActiveRecord::Migration
  def up
  	add_column :attendances,:time_diff,:integer
  	add_column :attendances,:note,:string
  end
end
