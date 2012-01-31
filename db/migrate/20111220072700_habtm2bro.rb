class Habtm2bro < ActiveRecord::Migration
	def change
		create_table :builds_items, :id => false do |t|
			t.references :item, :build
		end
  end
end
