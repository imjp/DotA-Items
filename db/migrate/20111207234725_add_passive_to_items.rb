class AddPassiveToItems < ActiveRecord::Migration
  def change
		add_column :items, :passive, :text
  end
end
