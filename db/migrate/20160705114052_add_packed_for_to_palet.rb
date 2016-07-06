class AddPackedForToPalet < ActiveRecord::Migration
  def change
    add_column :palets,:packed_for,:string
  end
end
