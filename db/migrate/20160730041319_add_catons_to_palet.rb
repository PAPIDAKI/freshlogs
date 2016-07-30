class AddCatonsToPalet < ActiveRecord::Migration
  def change
  	add_column :palets,:cartons,:integer
  	remove_column :palets,:cartons
  end
end
