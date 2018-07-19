class RemoveActiveColumnFromWorkersTable < ActiveRecord::Migration
  def up
    remove_column :workers,:active
  end
end
