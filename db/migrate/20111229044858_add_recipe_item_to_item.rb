class AddRecipeItemToItem < ActiveRecord::Migration
  def change		
		add_column :items, :recipe_item_1, :integer
		add_column :items, :recipe_item_2, :integer
		add_column :items, :recipe_item_3, :integer
		add_column :items, :recipe_item_4, :integer
  end
end
