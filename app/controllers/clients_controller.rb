class ClientsController < ApplicationController
  def new
  	@client = Client.new
  end

  def index
  	@clients= Client.all
  end	

  def create
  	@client=Client.create(client_params)
  	if @client.save
  		
  		redirect_to clients_path

  	else
  		flash.now[:error] = "Invalid Input"
  		render 'new'
  	end	
  end
  	
  private
  
  	def client_params
  		params.require(:client).permit(:name, :countary)
  	end	
end
