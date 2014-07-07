class RemoveEmailToAthletes < ActiveRecord::Migration
  def change
  	remove_column :athletes, :email
  end
end
