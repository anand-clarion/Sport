class RemoveTeamIdFromGames < ActiveRecord::Migration
  def up
  	remove_column :games, :team_id
  end

  def down
  end
end
