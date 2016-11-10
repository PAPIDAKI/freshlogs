class ModifyWorkersTable < ActiveRecord::Migration
  def up
    remove_column :workers,:workgroup_id,:integer


  end
end
