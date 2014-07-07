class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
    	t.string :name
      t.string :email
      t.string :city
      t.string :state
      t.integer :phone_no
      t.belongs_to :school
      t.timestamps
    end
  end
end
