class Habtm < ActiveRecord::Migration
  def change
		create_table :items_builds, :id => false do |t|
			t.references :item, :build
		end
  end
end
