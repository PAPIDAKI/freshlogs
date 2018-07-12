class AddNetKgColumnWeighings < ActiveRecord::Migration
  def  up 
   add_column :weighings,:net_kg,:integer 
  end

   def down
    remove_column :weighings,:net_kg 
   end
end
