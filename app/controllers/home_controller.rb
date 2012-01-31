class HomeController < ApplicationController
	def index
    @heros = Hero.order('name ASC') 
		@recent_builds = Build.recent
	end
end
