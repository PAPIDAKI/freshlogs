class AddGrowerIdToPmus < ActiveRecord::Migration
  def up
  	add_column :pmus,:grower_id,:integer,index: true
  end

  def down 
  	remove_column :pmus,:grower_id
  end
end
