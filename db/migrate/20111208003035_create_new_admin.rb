class CreateNewAdmin < ActiveRecord::Migration
  def up
		AdminUser.delete(1)
		AdminUser.create!(:email => 'jpbernadina@gmail.com', :password => 'z64qwq31Z', :password_confirmation => 'z64qwq31Z')
  end

  def down
  end
end
