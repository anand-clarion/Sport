class RenameColumnInSchools < ActiveRecord::Migration
  def up
    rename_column :schools, :name, :school_nam
  end

  def down
  end
  
end
