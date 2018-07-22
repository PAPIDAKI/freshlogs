class AddPriceAndNoteColumnsToWeighingsTable < ActiveRecord::Migration
  def up
  remove_column :weighings,:price_difference
  add_column :weighings ,:price_difference,:float, default:0.0
  #remove_column :weighings ,:note,:string
  #remove_column :weighings,:price
  end
end
