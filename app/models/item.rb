class Item < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => :slugged
	
	has_and_belongs_to_many :builds
	
	attr_accessible :name, :index_name, :description, :cost, :active, :bonus, :category, :passive,
									:recipe_item_1, :recipe_item_2, :recipe_item_3, :recipe_item_4
	validates_uniqueness_of :name
	validates_presence_of :name, :cost
	
	scope :order_by_name, order('name ASC')
end
