class CreateGameTeams < ActiveRecord::Migration
  def change
    create_table :game_teams do |t|
    	t.belongs_to :team
    	t.belongs_to :game
      t.timestamps
    end
  end
end
