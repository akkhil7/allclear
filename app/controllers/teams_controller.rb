class TeamsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @teams = Team.all

    render json: { teams: @teams}, status: 200
  end

  def my_team
    @team = current_user.team
    @members = @team.users
    render json: { team: @team, members: @members }, status: 200
  end

  def create
    @team = current_user.team
    @team.user_ids.each do |id|
      user = User.find(id)
      @team.users << user
    end
    @team.save!
    render json: {team: @team}, status: 200
  end

  private
    def team_params
      params.require(:team).permit(:user_ids => [])
    end
end
