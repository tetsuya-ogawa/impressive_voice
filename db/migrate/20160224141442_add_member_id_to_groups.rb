class AddMemberIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :member_id, :integer
  end
end
