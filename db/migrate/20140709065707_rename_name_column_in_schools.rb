class RenameNameColumnInSchools < ActiveRecord::Migration
  def up
    rename_column :schools, :school_nam, :name
  end

  def down
  end
  
end
