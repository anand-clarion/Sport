class Addstarttimeingame < ActiveRecord::Migration
  def up
  	add_column :games, :start_time, :datetime
  	add_column :games, :end_time, :datetime
  end

   def down
  	remove_column :games, :start_time
  	remove_column :games, :end_time
  end
end
