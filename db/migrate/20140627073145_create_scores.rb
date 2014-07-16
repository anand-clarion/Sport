class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :game
      t.belongs_to :athlete
      t.timestamps
    end
  end
end
