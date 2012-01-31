class RenamingTables < ActiveRecord::Migration
  def change
		rename_column :builds, :starting_items, :starting_item_1
		rename_column :builds, :early_items, :early_item_1
		rename_column :builds, :core_items, :core_item_1
		rename_column :builds, :situational_items, :situational_item_1
		
		add_column :builds, :starting_item_2, :integer
		add_column :builds, :starting_item_3, :integer
		add_column :builds, :starting_item_4, :integer
		add_column :builds, :starting_item_5, :integer
		add_column :builds, :starting_item_6, :integer
		
		add_column :builds, :early_item_2, :integer
		add_column :builds, :early_item_3, :integer
		add_column :builds, :early_item_4, :integer
		add_column :builds, :early_item_5, :integer
		add_column :builds, :early_item_6, :integer
		
		add_column :builds, :core_item_2, :integer
		add_column :builds, :core_item_3, :integer
		add_column :builds, :core_item_4, :integer
		add_column :builds, :core_item_5, :integer
		add_column :builds, :core_item_6, :integer
		
		add_column :builds, :situational_item_2, :integer
		add_column :builds, :situational_item_3, :integer
		add_column :builds, :situational_item_4, :integer
		add_column :builds, :situational_item_5, :integer
		add_column :builds, :situational_item_6, :integer
  end 
end
