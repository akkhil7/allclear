class ProjectsController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @projects_all = Project.all
    @projects = current_user.projects
<<<<<<< HEAD
    @users = User.all
=======
    render json: { projects: @projects }, status: 200
>>>>>>> 57fffa9385622a47af205c20e40b264296a80d9f
  end

  def show
    @project = Project.find(params[:id])
    render json: { project: @project }, status: 200
  end

  def create
    @project = Project.new(project_params)
    @project.created_by_id = current_user.id.to_s
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
<<<<<<< HEAD
    @project = Project.find(params[:id])
    @project.user_ids.each do |id|
      user=User.find(id)
      @project.users << user
    end

=======
    @project  =  Project.find(params[:id])
>>>>>>> 57fffa9385622a47af205c20e40b264296a80d9f
    @project.update_attributes(project_params)
    render json: @project, status: 200
  end

    private
      def project_params
<<<<<<< HEAD
        params.require(:project).permit(:name, :id, :created_by_id, :user_ids => []) 
        # :user_ids is a convention in rails since project has :id and user_ids rails will understand that we are trying
        # to create a relationship. so it will access the membership model and create a relationship
=======
        params.require(:project).permit(:name, :id, :created_by_id, :user_ids  => [])
>>>>>>> 57fffa9385622a47af205c20e40b264296a80d9f
      end

end
