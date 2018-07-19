class RenameTypeColumnInWorkersTable < ActiveRecord::Migration
  def up
    rename_column :workers,:type,:kind
  end

  def down

  end 
end
