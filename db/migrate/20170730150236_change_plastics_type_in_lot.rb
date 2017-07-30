class ChangePlasticsTypeInLot < ActiveRecord::Migration
  def up
  	add_column :lots,:crates,:integer
    # change_column :lots,:plastics,:integer,'integer USING CAST(plastics AS integer)'
    # change_column :lots, :plastics, 'integer USING CAST(plastics AS integer)'
  end

  def down

  end
end
