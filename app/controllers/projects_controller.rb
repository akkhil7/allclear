class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @projects = current_user.projects
  end

  def show
    @project=Project.find(params[:id])
  end

  def new
    @project=Project.new
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
    @project=Project.find(params[:id])
    @project.destroy
    render json: @project, status: 200
  end

  def update
    @project = Project.find(params[:id])

    users = params[:project][:users].split(",")

    users.each do |username|
      user = User.find_by username: username
      @project.users << user unless user.nil?
    end

    modified_params = project_params.except(:users)

    @project.update_attributes(modified_params)

    render json: @project, status: 200
  end

    private
      def project_params
        params.require(:project).permit(:name, :id, :users, :created_by_id)
      end

end
