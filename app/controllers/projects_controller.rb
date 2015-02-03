class ProjectsController < ApplicationController
  def index
  	@projects = Project.last_created_projects(9)
  	if @projects.empty? 
  		render 'no_projects_found'
  	end
  end

  def show
  	unless @projects = Project.find_by(id: params[:id])
  		render 'no_projects_found', layout: 'error'
  	end 
  end
end
