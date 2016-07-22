class AddLastNameToWorkerAndStatus < ActiveRecord::Migration
  def change
  
  	rename_column :workers,:name,:last_name
  	add_column :workers,:first_name,:string
  	add_column :workers,:phone,:string
  	add_column :workers ,:insurance,:string
  	add_column :workers,:active,:bool
  	add_column :workers,:age,:integer
  end
end
