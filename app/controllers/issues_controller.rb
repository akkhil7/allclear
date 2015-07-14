class IssuesController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  def index
    @issues=Issue.all
    render json: {issues: @issues}, status: 200
  end

  def show
    @issue=Issue.find(params[:id])
  end
  def create
    @issue=Issue.new(issue_params)
    @project = Project.find(@issue.project_id)
    @project.issues << @issue
    if @issue.save
      render json: @issue, status: 200
    else
      render json: @issue.errors, status: 422
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:title, :body, :priority, :project_id, :assigned_to_id)
  end
end
