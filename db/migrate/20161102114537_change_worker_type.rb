class ChangeWorkerType < ActiveRecord::Migration
  def up
    remove_column :workers,:type
    add_column :workers,:work_for,:string
  end
end
