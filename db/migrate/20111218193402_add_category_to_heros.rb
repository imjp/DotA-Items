class AddCategoryToHeros < ActiveRecord::Migration
  def change
		add_column :heros, :category, :string
  end
end
