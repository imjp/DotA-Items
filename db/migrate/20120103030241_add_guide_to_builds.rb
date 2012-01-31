class AddGuideToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :guide, :text
  end
end
