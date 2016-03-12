class AddDetailsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :kana_name, :string
    add_column :members, :gender, :integer
  end
end
