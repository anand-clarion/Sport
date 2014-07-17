class AddProviderToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :provider, :string
    add_column :athletes, :uid, :string
  end
end
