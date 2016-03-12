class AddDetailToEvent < ActiveRecord::Migration
  def change
    add_column :events, :held_day, :string
    add_column :events, :deadline, :string
  end
end
