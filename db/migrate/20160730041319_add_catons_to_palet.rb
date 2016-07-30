class AddCatonsToPalet < ActiveRecord::Migration
  def change
  	add_column :palets,:cartons,:integer
  end
end
