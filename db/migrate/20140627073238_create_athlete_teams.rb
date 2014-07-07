class CreateAthleteTeams < ActiveRecord::Migration
  def change
    create_table :athlete_teams do |t|
    	t.belongs_to :athlete
    	t.belongs_to :team
      t.timestamps
    end
  end
end
