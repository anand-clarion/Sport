class AddAvatarToAthletes < ActiveRecord::Migration
  def self.up
    add_attachment :athletes, :avatar
  end

  def self.down
    remove_attachment :athletes, :avatar
  end
end
