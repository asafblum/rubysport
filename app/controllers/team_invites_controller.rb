class TeamInvitesController < ApplicationController


def register
    
    @team = Team.find( params[:team_id])

    @player = Player.new(params[:player])
     @member = Member.new(parms[:member])
   #@member = @player.members.build(params[:team_id]) #In the case of a has_many
    #@member.team = @team
    #@member.player = @player


  if @player .save && @member.save

         redirect_to login
  
  else
  
  end


end





def show
    @team_invite = TeamInvite.find(params[:id])
  
   @player = Player.new
   @member = @player.members.build

  @player.email = @team_invite.invitee_email
  
  @member.team_id = @team_invite.member.team_id
 # @member.player= @player
  

end

  def create
          @member = Member.find(params[:member_id])
          #@member = Team.members.find_by_player_id(current_user.id)
          @team_invite  = @member.team_invites.create(params[:team_invite])
          redirect_to team_path(@member.team)

  # GET /locations/new
  # GET /locations/new.json
  end
  def new
    @team_invite = TeamInvite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json:  @team_invite  }
    end
  end



  #        redirect_to team_path(@team)
 
    def destroy
    @member = Member.find(params[:id])
    @team = Team.find(@member.team_id)
    @member.destroy
redirect_to team_path(@team)

    end
end
