ActiveAdmin.register Hero do
  index do
		column :name
		column :category
		column :slug 
		
		default_actions
	end
	
	form do |f|
		f.inputs "Enter Hero Info below" do
			f.input :name 
			f.input :category, :as => :radio, :collection => ["Strength", "Agility", "Intelligence"]
		end
		
		f.buttons
	end
end
