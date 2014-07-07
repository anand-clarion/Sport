class AddAvatarColumnsToTeams < ActiveRecord::Migration
  def self.up
    add_attachment :teams, :avatar
  end

  def self.down
    remove_attachment :teams, :avatar
  end
end
