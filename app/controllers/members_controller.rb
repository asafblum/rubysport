class MembersController < ApplicationController
  def create
    
          @team = Team.find(params[:team_id])
          @member = @team.members.create(params[:member])
          redirect_to team_path(@team)
  end
    def destroy
    @member = Member.find(params[:id])
    @team = Team.find(@member.team_id)
    @member.destroy
redirect_to team_path(@team)
    
    end





end
