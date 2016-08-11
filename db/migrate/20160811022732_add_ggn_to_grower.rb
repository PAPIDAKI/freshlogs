class AddGgnToGrower < ActiveRecord::Migration
  def up
  	add_column :growers,:ggn,:string
  end
end
