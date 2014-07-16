class RenameSchoolNameInSchools < ActiveRecord::Migration
  def up
    rename_column :schools, :school_name, :name
  end

  def down
  end
  
end
