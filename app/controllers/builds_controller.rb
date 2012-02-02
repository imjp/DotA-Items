class BuildsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index, :download]
	before_filter :get_user, :only => [:new, :create, :edit, :update]
	caches_action :index
	caches_action :show, :layout => false
	
	
	def index   
		@hero = Hero.find(params[:hero_id]) 
		@heros = Hero.where(:id => :hero_id).scoped  
		@builds = Build.where(:hero_id => @hero.id).scoped
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
		
		expires_in 5.minutes
		fresh_when @build, public: true
	end
	
	def new 
		not_buyable = [126,127,128]   
		@items = Item.where('id not in (?)', not_buyable).order_by_name
		
		@build = @user.builds.build
		@heros = Hero.order_by_name 
		
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
		not_buyable = [126,127,128]   
		@items = Item.where('id not in (?)', not_buyable).order_by_name
		
		@build = Build.where(:user_id => @user.id).find(params[:id]) 		
		@heros = Hero.order_by_name 
		
		
		unless current_user.id == @user.id
			respond_to do |format| 
				format.html { redirect_to root_path, notice: 'You are only allowed to edit your own builds.' }
			end
		end
		
	end
	
	def update  
		@build = Build.find(params[:id])
		@hero = Hero.find(@build.hero_id)
		
		@heros = Hero.order_by_name
		@items = Item.order_by_name
		
		respond_to do |format|
      if @build.update_attributes(params[:build])
        format.html { redirect_to hero_build_path(@hero), notice: 'Build was successfully updated.' }
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
