class AddAdminToathletes < ActiveRecord::Migration
  def up
  	add_column :athletes, :admin, :boolean, :default => false
  end

  def down
  	remove_column :athletes, :admin
  end
end
