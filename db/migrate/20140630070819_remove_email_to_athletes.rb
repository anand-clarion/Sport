class RemoveEmailToAthletes < ActiveRecord::Migration
  def up
  	remove_column :athletes, :email
  end

  def down
    add_column :athletes, :email, :string
  end
end
