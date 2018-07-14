class DropAttPreformanceTable < ActiveRecord::Migration
  def up
  drop_table :att_performances
  end

  def down
  end
end
