class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @users=User.all
    render json: @users, root: "users"
  end

  def new
  @user=User.new()
  end

  def create
    @user = User.new(user_params)
    @team = Team.new()

    if @user.save!
      @team.user_id = @user.id
      if @team.save!
        @user.team_id = @team.id
        @team.created_by_id = @user.id
      end
      render json: @user, status: 200
    else
      render json: @user.errors, status: 422
    end
  end

  def me
    @currentuser = current_user
    render json: @currentuser, status: 200
  end
 private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end


