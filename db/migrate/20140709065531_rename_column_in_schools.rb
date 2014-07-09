class RenameColumnInSchools < ActiveRecord::Migration
  def change
    rename_column :schools, :name, :school_nam
  end
end
