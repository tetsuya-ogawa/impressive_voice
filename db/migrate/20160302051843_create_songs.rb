class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.float :time
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
