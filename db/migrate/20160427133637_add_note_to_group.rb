class AddNoteToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :note, :text
  end
end
