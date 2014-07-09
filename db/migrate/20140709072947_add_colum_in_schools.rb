class AddColumInSchools < ActiveRecord::Migration
  def up
    add_column :schools, :school_name, :string
    School.all.each do |school|
      school.school_name = school.name
      school.save!
    end
    remove_column :schools, :name
  end

  def down
    add_column :schools, :name, :string
    School.all.each do |school|
      school.name = school.school_name
      school.save!
    end
    remove_column :schools, :school_name
  end
  
end
