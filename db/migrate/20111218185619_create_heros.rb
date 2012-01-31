class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
		
		add_index :heros, :slug, :unique => true
  end
end
