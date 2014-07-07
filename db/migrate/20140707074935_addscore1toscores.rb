class Addscore1toscores < ActiveRecord::Migration
  def up
  	add_column :scores, :team1, :integer
  	add_column :scores, :score1, :integer
  	add_column :scores, :team2, :integer
  	add_column :scores, :score2, :integer
  end
  def down
  	remove_column :scores, :team1
  	remove_column :scores, :score1
  	remove_column :scores, :team2
  	remove_column :scores, :score2
  end

end
