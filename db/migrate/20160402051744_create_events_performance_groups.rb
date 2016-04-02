class CreateEventsPerformanceGroups < ActiveRecord::Migration
  def change
    create_table :events_performance_groups do |t|
      t.integer :event_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
