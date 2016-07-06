class AddNoteToLots < ActiveRecord::Migration
  def change
    add_column :lots,:note,:string
  end
end
