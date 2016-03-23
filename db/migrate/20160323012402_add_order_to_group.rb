class AddOrderToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :order, :integer
  end
end
