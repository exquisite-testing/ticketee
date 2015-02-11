class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    
    def new
        @project = Project.new
    end
    
    
    def show
        @project = Project.find(params[:id])
    end
    
    def create
        @project = Project.new(project_params)
        
        if @project.save
            flash[:notice] = "Project has been created."
            redirect_to @project
            
            else
            flash[:alert] = "Project has not been created."
             render "new"
        end
        
    end
    
    def update
        if @project.update(project_params)
            flash[:notice] = "Project has been updated."
            redirect_to @project
            else
            flash[:alert] = "Project has not been updated."
            render "edit"
        end
    end
    
    def destroy
        @project.destroy
        
        flash[:notice] = "Project has been destroyed."
        
        redirect_to projects_path
    end
    
    private
    def project_params
        params.require(:project).permit(:name, :description)
    end
  
    
    
    
end