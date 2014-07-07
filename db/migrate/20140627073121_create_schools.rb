class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.text :name
    	t.text :address
    	t.string :phone_no
      t.timestamps
    end
  end
end
