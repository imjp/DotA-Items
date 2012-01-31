class CreateItemBuilds < ActiveRecord::Migration
  def change
    create_table :item_builds do |t|
      t.string :name
      t.string :starting_items
      t.string :early_items
      t.string :core_items
      t.string :situational_items
      t.string :hero
      t.references :user

      t.timestamps
    end
    add_index :item_builds, :user_id
  end
end
