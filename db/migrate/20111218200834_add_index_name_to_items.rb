class AddIndexNameToItems < ActiveRecord::Migration
  def change
		add_column :items, :index_name, :string
  end
end
