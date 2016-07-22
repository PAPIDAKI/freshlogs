class AddWIdToWorkers < ActiveRecord::Migration
  def change
  	add_column :workers,:w_id,:integer
  end
end
