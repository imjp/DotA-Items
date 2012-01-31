ActiveAdmin.register User do
  index do
		column :id
		column :email
		column :name 
		
		default_actions
	end 
	
	form do |f|
		f.inputs "Enter the User Info below" do
			f.input :email
			f.input :name 
		end
		
		f.buttons
	end
end
