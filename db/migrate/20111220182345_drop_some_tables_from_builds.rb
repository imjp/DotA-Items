class DropSomeTablesFromBuilds < ActiveRecord::Migration
  def change
		change_column :builds, :starting_items, :integer
		change_column :builds, :early_items, :integer
		change_column :builds, :core_items, :integer
		change_column :builds, :situational_items, :integer
  end 
end
