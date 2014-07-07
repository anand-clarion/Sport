class AddColumnToLikes < ActiveRecord::Migration
  def change
  	t.integer :value
    t.integer :likable_id
    t.string :likable_type
  end
end
