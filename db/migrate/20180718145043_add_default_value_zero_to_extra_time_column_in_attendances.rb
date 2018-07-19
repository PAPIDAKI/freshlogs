class AddDefaultValueZeroToExtraTimeColumnInAttendances < ActiveRecord::Migration
  def  up
  change_column :attendances,:extra_time,:integer,:default=> 0
  end
end
