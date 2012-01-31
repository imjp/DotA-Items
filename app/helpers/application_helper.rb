module ApplicationHelper
	def title
	 base_title = "DotaVault"
	 if @title.nil?
		base_title
	 else
		"#{@title} | #{base_title}"
	 end
	end	
	
	def item_name(id = "5")
		@item = Item.find(id)
		"#{@item.name}"
	end
	
	
	
	def item_slug(id)
		@item = Item.find(id)
		"#{@item.slug}"
	end
	
	def item_description(id)
		@item = Item.find(id)
		"#{@item.description}"
	end
	
	def item_cost(id)
		@item = Item.find(id)
		"#{@item.cost}"
	end
	
	def item_active(id)
		@item = Item.find(id)
		"#{@item.active}"
	end
	
	def item_bonus(id)
		@item = Item.find(id)
		"#{@item.bonus}"
	end
	
	def item_category(id)
		@item = Item.find(id)
		"#{@item.category}"
	end
	
	def item_passive(id)
		@item = Item.find(id)
		"#{@item.passive}"
	end 
	
	def item_recipe_1(id)
		@item = Item.find(id)
		"#{@item.recipe_item_1}"
	end 
	
	def item_recipe_2(id)
		@item = Item.find(id)
		"#{@item.recipe_item_2}"
	end 
	
	def item_recipe_3(id)
		@item = Item.find(id)
		"#{@item.recipe_item_3}"
	end 
	
	def item_recipe_4(id)
		@item = Item.find(id)
		"#{@item.recipe_item_4}"
	end 
end
