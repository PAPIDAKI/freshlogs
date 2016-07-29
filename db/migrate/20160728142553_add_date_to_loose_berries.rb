class AddDateToLooseBerries < ActiveRecord::Migration
  def change
  	add_column :loose_berries,:date,:datetime
  end
end
