class UsersController < ApplicationController
	before_filter :authenticate_user!
	
	def show
		@user = User.find(params[:id])
		@builds = Build.where(:user_id => @user.id).order('created_at DESC')
		@recent_builds = Build.recent
		
		@title = "#{@user.name}'s builds"
		
		unless current_user.id == @user.id
			respond_to do |format| 
				format.html { redirect_to root_path, notice: 'You are only allowed to view your own builds.' }
			end
		end
	end
	
	def destroy
    @build = Build.find(params[:id])
    @build.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Build removed.' }
      format.json { head :ok }
    end
  end
	 
end