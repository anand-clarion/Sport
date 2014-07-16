class AddSchoolidToTeams < ActiveRecord::Migration
  def up
  	add_column :teams, :school_id, :integer
  end

  def down
    remove_column :teams, :school_id
  end
end
