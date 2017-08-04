class AddStiTypeToWorkerTable < ActiveRecord::Migration
  def up
  	add_column :workers,:type,:string
  end

  def down

  end
end
