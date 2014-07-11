class AddteamIdtoathletes < ActiveRecord::Migration
  def up
    add_column :athletes, :team_id, :integer
  end

  def down
    remove_column :athletes, :team_id
  end
end
