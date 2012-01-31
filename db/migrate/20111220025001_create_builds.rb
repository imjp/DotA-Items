class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :name
      t.string :starting_items
      t.string :early_items
      t.string :core_items
      t.string :situational_items
      t.references :hero
      t.references :user

      t.timestamps
    end
    add_index :builds, :hero_id
    add_index :builds, :user_id
  end
end
