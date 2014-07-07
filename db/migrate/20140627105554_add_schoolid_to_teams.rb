class AddSchoolidToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :school_id, :integer
  end
end
