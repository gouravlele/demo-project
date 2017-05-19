class ProjectsController < ApplicationController
	def index
		@projects=Project.all
	end

	def new
		@project=Project.new
	end

	def create	
		@developer=Developer.find(params[:developer])
		@project=@developer.projects.create(name:params[:name],technology:params[:technology])
		redirect_to projects_path
	end
	def edit
		@project=Project.find(params[:id])
	end

	def update
	  @project = Project.find(params[:id])
      if 
        @project.update(name:params[:name],technology:params[:technology])
        redirect_to projects_path
      else
        render 'edit'
      end
	end

	def show
		@project=Project.find(params[:id])
	end

	def destroy
		@project=Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end
end
