class TeamsController < ApplicationController
  def create
    @team.member_ids.each do |member|
      current_user.teams.build(:member_id => :id)
    end
    if @team.save
      render json: @team, status: 200
    else
      render json: @team.errors, status: 422
    end
  end
  def team_params
    params.require(:team).permit(:member_ids => [])
  end
end
