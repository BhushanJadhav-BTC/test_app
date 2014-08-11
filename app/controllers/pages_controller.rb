class PagesController < ApplicationController
 
 def home
 	@page=Page.all
 end	

  def new
  	@page=Page.new
  end

  def contact

  end

  	
  def create 
  	@page=Page.create(page_params)
  	if @page.save
  		
  		# home @page
  		redirect_to root_path

  	else
  		flash.now[:error] = "Invalid Input"
  		render 'new'
  	end	
  end

  private

  	def page_params
  		params.require(:page).permit(:name, :code, :description, :billing, :start, :deadline, :end, :github, :status )
  	end	
end
