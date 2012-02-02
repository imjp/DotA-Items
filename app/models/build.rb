class Build < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => :slugged
	
	 
	 
	has_and_belongs_to_many :items 
  belongs_to :hero
  belongs_to :user	 
	
	attr_accessible  :name, :hero_id, :user_id, :guide,
			:starting_item_1, :early_item_1, :core_item_1, :situational_item_1,
			:starting_item_2, :early_item_2, :core_item_2, :situational_item_2,
			:starting_item_3, :early_item_3, :core_item_3, :situational_item_3,
			:starting_item_4, :early_item_4, :core_item_4, :situational_item_4,
			:starting_item_5, :early_item_5, :core_item_5, :situational_item_5,
			:starting_item_6, :early_item_6, :core_item_6, :situational_item_6

	validates :name, :presence => true, :uniqueness => true, :length => { :in => 5..40 } 
	
	validates_presence_of :hero_id, :starting_item_1, :early_item_1, :core_item_1
	
	
	
	scope :order_by_name, order('name ASC')
	scope :recent, order('created_at DESC').limit(10)
	
	
	def hero_name(id)
		@hero = Hero.find(id)
		"#{@hero.name}"
	end
	
	def hero_slug(id) 
		@hero = Hero.find(id)
		if @hero.slug == "queen-of-pain"
			"queenofpain"
		elsif @hero.slug == "vengeful-spirit"
			"vengefulspirit"
		elsif @hero.slug == "zeus"
			"zuus"
		else
			"#{@hero.slug}"
		end
	end
	
	def item_index_name(id)
		unless id == nil
			@item = Item.find(id)
			"\"item\"		\"#{@item.index_name}\""
		end
	end
	
	
	def as_file	
		output = "\"itembuilds/default_#{hero_name(self.hero_id).underscore}.txt \"
{
	\"hero\"		\"npc_dota_hero_#{hero_slug(self.hero_id).underscore}\"
	\"author\"	\"DotaVault.com\"	
	\"Title\"		\"Recommended items for #{hero_name(self.hero_id)}\"

	\"Items\"
	{
		\"#DOTA_Item_Build_Starting_Items\"
		{
			#{item_index_name(self.starting_item_1)} 
			#{item_index_name(self.starting_item_2)} 
			#{item_index_name(self.starting_item_3)} 
			#{item_index_name(self.starting_item_4)} 
			#{item_index_name(self.starting_item_5)} 
			#{item_index_name(self.starting_item_6)} 
		}
		
		#DOTA_Item_Build_Early_Game
		{
			#{item_index_name(self.early_item_1)} 
			#{item_index_name(self.early_item_2)} 
			#{item_index_name(self.early_item_3)} 
			#{item_index_name(self.early_item_4)} 
			#{item_index_name(self.early_item_5)} 
			#{item_index_name(self.early_item_6)} 
		}
		
		#DOTA_Item_Build_Core_Items
		{
			#{item_index_name(self.core_item_1)} 
			#{item_index_name(self.core_item_2)} 
			#{item_index_name(self.core_item_3)} 
			#{item_index_name(self.core_item_4)} 
			#{item_index_name(self.core_item_5)} 
			#{item_index_name(self.core_item_6)} 
		}
		
		#DOTA_Item_Build_Luxury
		{
			#{item_index_name(self.situational_item_1)} 
			#{item_index_name(self.situational_item_2)} 
			#{item_index_name(self.situational_item_3)} 
			#{item_index_name(self.situational_item_4)} 
			#{item_index_name(self.situational_item_5)} 
			#{item_index_name(self.situational_item_6)} 
		}
	}
}
"  
	end
	
	
end
