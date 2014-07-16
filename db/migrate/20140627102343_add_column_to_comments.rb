class AddColumnToComments < ActiveRecord::Migration
  def up
  	add_column :comments, :content, :string
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end

  def down
    remove_column :comments, :content
    remove_column :comments, :commentable_id
    remove_column :comments, :commentable_type
  end
end
