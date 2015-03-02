class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @projects = Project.all
  end
  def add_user
    @p_users=User.find(params[:id])
  end
  def show
    @project=Project.find(params[:id])
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      @user.projects << @project
      render json: @project, status: 200
    else
      render json: @project.errors, status: 422
    end
  end
  def destroy
    @project=Project.find(params[:id])
    @project.destroy
  end
  private
    def project_params
      params.require(:project).permit(:name)
    end


end
