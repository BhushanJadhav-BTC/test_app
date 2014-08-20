class PagesController < ApplicationController
 
 def home
    if params[:search] || params[:status] || params[:client]
            #@page = Page.search(params[:search])
        @page=Page.paginate(:page => params[:page], :per_page => 4).where('name LIKE? OR status LIKE?', "%#{params[:search]}%", "%#{params[:status]}%").all
        @clients=Client.where("client LIKE?", "%#{params[:client]}%")
        # @page=Page.paginate(:page => params[:page], :per_page => 2, :conditions => ['name LIKE?', "%#{search}%"]).order("deadline ASC").all
    else  
 	      @page=Page.paginate(:page => params[:page], :per_page => 4).order("deadline ASC").all
        #@page = Page.paginate(:page => params[:page], :per_page => 2, :order => 'created_at DESC')
    end

 end	

  def new
  	@page=Page.new
    @clients=Client.all
  end



  def contact

  end

  def edit
    @page = Page.find(params[:id])
  end  

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:success] = "Updated"
      redirect_to root_path
    else
      render 'edit'
    end  
  end  

  def destroy
    Page.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to root_path
  end  
  	
  def create 
  	@page=Page.create(page_params)
  	if @page.save
  		
  		redirect_to root_path

  	else
  		flash.now[:error] = "Invalid Input"
      @clients=Client.all
  		render 'new'
  	end	
  end

  private

  	def page_params
  		params.require(:page).permit(:name, :code, :description, :billing, :start, :deadline, :end, :github, :status, :client_id )
  	end	
end
