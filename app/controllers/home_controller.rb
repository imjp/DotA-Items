class HomeController < ApplicationController
	def index
    @heros = Hero.order('name ASC') 
		@recent_builds = Build.recent
		
		
		expires_in 5.minutes
		fresh_when last_modified: @heros.maximum(:updated_at) 
	end
end
