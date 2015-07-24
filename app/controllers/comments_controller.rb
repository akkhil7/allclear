class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @comments = Comment.all
    render json: @comments, status: 200
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment, status: 200
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      render json: @comment, status: 200
    else
      render json: @comment.errors, status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :body, :issue_id, :user_id)
  end

end
