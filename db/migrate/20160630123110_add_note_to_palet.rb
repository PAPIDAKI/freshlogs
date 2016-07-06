class AddNoteToPalet < ActiveRecord::Migration
  def change
    add_column :palets,:note,:string
  end
end
