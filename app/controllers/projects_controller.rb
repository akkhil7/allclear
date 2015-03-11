class ProjectsController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @projects = current_user.projects
    render json: { projects: @projects }, status: 200
  end

  def show
    @project = Project.find(params[:id])
    render json: { project: @project }, status: 200
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      current_user.projects << @project
      render json: @project, status: 200
    else
      render json: @project.errors, status: 422
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    render json: @project, status: 200
  end

  def update
    @project  =  Project.find(params[:id])
    @project.update_attributes(project_params)

    render json: @project, status: 200
  end

    private
      def project_params
        params.require(:project).permit(:name, :id, :created_by_id, :user_ids  => [])
      end

end
