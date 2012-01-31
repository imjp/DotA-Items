class Hero < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => :slugged
	
	attr_accessible :name, :category, :slug	
	
	has_many :builds
	
	validates_uniqueness_of :name
	
	
	scope :order_by_name, order('name ASC')
	
	def next_hero
		self.class.first(:conditions => ["name > ?", name], :order => "name asc")
	end

	def previous_hero
		self.class.first(:conditions => ["name < ?", name], :order => "name desc")
	end 
end
