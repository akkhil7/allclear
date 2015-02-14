class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: 200
    else
      render json: @project.errors, status: 422
    end
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end
