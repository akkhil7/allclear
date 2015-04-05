class IssuesController < ApplicationController
  def index
    @issues=Issue.all
  end
  def show
    @issue=Issue.find(params[:id])
  end
  def create
    @issue=Issue.new(issue_params)
    if @issue.save
      render json: @issue, status: 200
    else
      render json: @issue.errors, status: 422
    end
  end

  private
  def issue_params
    params.require(:issue).permit(:title, :description, :priority)
end
