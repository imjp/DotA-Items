class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :cost
      t.text :active
      t.text :bonus
      t.string :category

      t.timestamps
    end
  end
end
