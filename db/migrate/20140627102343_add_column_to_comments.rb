class AddColumnToComments < ActiveRecord::Migration
  def change
  	t.text :content
    t.integer :commentable_id
    t.string :commentable_type
  end
end
