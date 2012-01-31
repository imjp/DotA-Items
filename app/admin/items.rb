ActiveAdmin.register Item do 
  index do
		column :name
		column :index_name
		column :category 
		column :slug
		column :cost  
		
		default_actions
	end
	
	form do |f|
		f.inputs "Enter Item Info below" do
			f.input :name
			f.input :index_name
			f.input :category, :as => :select, :collection => [
				"consumables", "attributes", "armaments", "arcane", "common", "support", "caster",
				"weapons", "armor", "artifacts", "secret-shop", "drop-only"														
			]
			
			f.input :cost
			
			f.input :description, :input_html => { :rows => "4" }			
			f.input :bonus, :input_html => { :rows => "4" }
			f.input :passive, :label => "Passive Ability", :input_html => { :rows => "4" }
			f.input :active, :label => "Active Ability", :input_html => { :rows => "4" }
			
			f.input :recipe_item_1, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :recipe_item_2, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :recipe_item_3, :as => :select, :collection => Item.find(:all, :order => "name ASC")
			f.input :recipe_item_4, :as => :select, :collection => Item.find(:all, :order => "name ASC")
		end
		
		f.buttons
	end
end
