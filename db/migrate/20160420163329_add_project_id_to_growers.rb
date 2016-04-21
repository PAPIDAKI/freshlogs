class AddProjectIdToGrowers < ActiveRecord::Migration
  def change
  	add_reference :growers,:project,index:true
  end
end
