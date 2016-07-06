class RemoveProjectIdFromPmu < ActiveRecord::Migration
  def  up
    remove_column :pmus,:project_id
  end
  def down
    add_column :pmus,:project_id,:integer,:index=>true
   end
  
end
