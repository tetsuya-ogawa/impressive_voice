class AddNumberPersonToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :number_person, :integer
  end
end
