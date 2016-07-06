class AddKgAndCratesToLot < ActiveRecord::Migration

  def up
  	add_column :lots,:kg,:float
  	add_column :lots,:plastics,:string
  end

   def down
  	remove_colunn :lots,:kg
  	remove_colunn :lots,:plastics
   end

end
