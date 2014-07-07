class Addusertolikes < ActiveRecord::Migration
  def up
  	add_column :likes, :user, :integer
  end
  def down
  	remove_column :likes, :user
  end
end
