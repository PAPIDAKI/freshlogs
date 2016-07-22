class ReorderWorkerAttributes < ActiveRecord::Migration
  def up
  	change_column :workers, :first_name, :string, after: :last_name
  end

  def down

  end
end
