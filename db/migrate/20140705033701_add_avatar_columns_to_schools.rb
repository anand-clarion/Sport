class AddAvatarColumnsToSchools < ActiveRecord::Migration
  def self.up
    add_attachment :schools, :avatar
  end

  def self.down
    remove_attachment :schools, :avatar
  end
end
