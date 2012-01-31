ActiveAdmin.register Build do
	index do
		column :hero
		column :user
		column :name 
		
		default_actions
	end
	
	form do |f|
		f.inputs "Enter Build info below" do
			f.input :hero_id, :as => :select, :collection => Hero.find(:all, :order => "name ASC")
			f.input :user_id, :as => :select, :collection => User.find(:all, :order => "name ASC")
			f.input :name
			f.input :guide
			
			f.input :starting_item_1, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :starting_item_2, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :starting_item_3, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :starting_item_4, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :starting_item_5, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :starting_item_6, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			
			f.input :early_item_1, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :early_item_2, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :early_item_3, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :early_item_4, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :early_item_5, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :early_item_6, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			
			f.input :core_item_1, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :core_item_2, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :core_item_3, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :core_item_4, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :core_item_5, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :core_item_6, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			
			f.input :situational_item_1, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :situational_item_2, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :situational_item_3, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :situational_item_4, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :situational_item_5, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :situational_item_6, :as => :select, :collection => Item.find(:all, :order => "name ASC")
		end
		
		f.buttons
	end
end
