class LeDrop < ActiveRecord::Migration
 def change
		drop_table :item_builds
  end
end
