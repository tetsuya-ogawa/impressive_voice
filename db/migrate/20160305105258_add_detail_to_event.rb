class AddDetailToEvent < ActiveRecord::Migration
  def change
    add_column :events, :held_day, :datetime
    add_column :events, :deadline, :datetime
  end
end
