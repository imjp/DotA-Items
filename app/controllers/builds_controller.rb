class BuildsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index, :download]
	before_filter :get_user, :only => [:new, :create, :edit, :update]
	caches_action :index
	caches_action :show, :layout => false
	
	
	def index   
		@hero = Hero.find(params[:hero_id]) 
		@heros = Hero.where(:id => :hero_id).all  
		@builds = Build.where(:hero_id => @hero.id).all
		@recent_builds = Build.recent
		
		@title = "Builds for #{@hero.name}"
	end
	
	def show 
		@hero = Hero.find(params[:hero_id]) 
		@heros = Hero.all
    @build = Build.where(:hero_id => @hero.id).find(params[:id])
		@builds = Build.where(:hero_id => @hero.id).limit(5).order('created_at DESC').each
		@recent_builds = Build.recent
		@title = @build.name 
	end
	
	def new 
		@build = @user.builds.build
		@heros = Hero.order_by_name
		@items = Item.order_by_name
		
		@title = "New Build"
	end
	
  def create 
    @build = @user.builds.create(params[:build])

		@heros = Hero.order_by_name
		@items = Item.order_by_name
		respond_to do |format|
			if @build.save
				format.html { redirect_to root_path, notice: 'Build was successfully created.' } 
			else
				format.html { render action: "new" }
			end
		end
		
		expire_action :action => :index
  end  
	
	def edit   
		@build = Build.where(:user_id => @user.id).find(params[:id]) 
		
		@heros = Hero.order_by_name
		@items = Item.order_by_name
		
		
		unless current_user.id == @user.id
			respond_to do |format| 
				format.html { redirect_to root_path, notice: 'You are only allowed to edit your own builds.' }
			end
		end
		
	end
	
	def update  
		@hero = Hero.where(:hero_id => @build.hero_id)
		
		@heros = Hero.order_by_name
		@items = Item.order_by_name
		
		respond_to do |format|
      if @build.update_attributes(params[:build])
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @build.errors, status: :unprocessable_entity }
      end
    end	
	end
	
	def destroy
    @build = Build.find(params[:id])
    @build.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Build removed.' }
      format.json { head :ok }
    end
  end	
	
	def download
		@build = Build.find(params[:id]) 
		@hero = Hero.find(params[:hero_id])
		send_data @build.as_file,
			:filename => "default_#{hero_slug(@hero.id).underscore}.txt",
			:type => "text/plain"
	end
	
	def get_user
		@user = User.find(params[:user_id])		
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
end