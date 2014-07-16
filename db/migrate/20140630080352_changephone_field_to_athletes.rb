class ChangephoneFieldToAthletes < ActiveRecord::Migration
  def up
  	change_column :athletes, :phone_no, :bigint
  end

  def down
  end
end
