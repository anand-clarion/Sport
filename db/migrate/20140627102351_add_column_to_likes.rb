class AddColumnToLikes < ActiveRecord::Migration
  def up
    add_column :likes, :value, :integer
    add_column :likes, :likable_id, :integer
    add_column :likes, :likable_type, :string
  end
  def down
    remove_column :likes, :value
    remove_column :likes, :likable_id
    remove_column :likes, :likable_type
  end

end
