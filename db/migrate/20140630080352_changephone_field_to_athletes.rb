class ChangephoneFieldToAthletes < ActiveRecord::Migration
  def change
  	change_column :athletes, :phone_no, :bigint
  end
end
