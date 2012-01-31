class User < ActiveRecord::Base  	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	acts_as_voter	
	
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
	
	has_many :builds, :dependent => :destroy 
	
	validates_uniqueness_of :email, :name
	validates_presence_of :name, :email, :password, :password_confirmation
	validates_format_of :name, :with => /^[a-zA-Z\d ]*$/i, :message => "Username can only contain letters and numbers."	
	
	validates :name, :length => { :in => 5..40 }
	validates :password, :length => { :in => 6..40 } 
	
	scope :order_by_name, order('name ASC')
end
