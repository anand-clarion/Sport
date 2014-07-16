class Addteam1ingames < ActiveRecord::Migration
  def up
  	add_column :games, :team1, :integer
  	add_column :games, :team2, :integer
  end

  def down
    remove_column :games, :team1
    remove_column :games, :team2
  end
  
end
