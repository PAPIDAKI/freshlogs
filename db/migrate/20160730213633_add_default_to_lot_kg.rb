class AddDefaultToLotKg < ActiveRecord::Migration
  def change
  	change_column :lots,:kg,:decimal,:default => 0.0
  end
end
