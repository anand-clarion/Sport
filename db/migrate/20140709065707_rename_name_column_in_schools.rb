class RenameNameColumnInSchools < ActiveRecord::Migration
  def change
    rename_column :schools, :school_nam, :name
  end
end
