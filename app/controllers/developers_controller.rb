class DevelopersController < ApplicationController
	def index
		@developers=Developer.all
	end

	def show
		@developer=Developer.find(params[:id])
	end

	def new
		@developer=Developer.new
	end

	def create
    @project=Project.find(params[:project])   
    @project= @project.developers.create(name:params[:name] ,city:params[:city])
    redirect_to developers_path
	end
    
    def edit
    	@developer=Developer.find(params[:id])
    end

    def update
        @developer = Developer.find(params[:id])
      if 
        @developer.update(name:params[:name] ,city:params[:city])
        redirect_to developers_path
      else
        render 'edit'
      end
    end

    def destroy
    	@developer=Developer.find(params[:id])
    	@developer.destroy
    	redirect_to developers_path
    end
end
