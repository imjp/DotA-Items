class ItemsController < ApplicationController

  caches_action :index
  caches_action :show, :layout => false


  def index
    @items = Item.order('cost ASC')
		@item = Item.first
		@title = "Item list for DotA 2"
		
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def show
    @item = Item.find(params[:id])
		@title = @item.name 
		 
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'You cannot view individual items yet.' } 
      format.json { render json: @item }
    end
  end 
	
	def create
		expire_action :action => :index
	end
end
