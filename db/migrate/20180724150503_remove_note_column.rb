class RemoveNoteColumn < ActiveRecord::Migration
  def up 
  remove_column :weighings,:note
  end
end
