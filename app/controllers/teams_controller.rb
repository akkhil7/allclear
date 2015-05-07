class TeamsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def index
    @teams_all = Team.all
    @team = current_user.team
    @friends = @team.users
    render json: { teams: @team, friends: @friends }, status: 200
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
