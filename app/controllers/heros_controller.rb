class HerosController < ApplicationController
	before_filter :get_heroes, :only => [:index, :show]

  caches_action :index
  caches_action :show, :layout => false


	def index
		@title = "Hero list for DotA 2"
		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heros }
    end
  end
	
  def show
    @hero = Hero.find(params[:id])
		@build = Build.where(:hero_id => @hero.id).last
		@builds = Build.where(:hero_id => @hero.id).limit(5).order('created_at DESC').each
		@recent_builds = Build.recent
		@title = @hero.name
		 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hero }
    end
  end
	
	def create
		expire_action :action => :index
	end
	
	def get_heroes	
    @heros = Hero.order_by_name
	end
end
