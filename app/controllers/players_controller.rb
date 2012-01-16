class PlayersController < ApplicationController
  def create
  #   @member = Member.new
    #@team = Team.find(params[:team_id])
       @player = Player.new(params[:player])
    if @player.invitation

        if @player.invitation.team_id
          @member = @player.members.new
          @member.team_id =  @player.invitation.team_id
        end
    end
    if @player.save 
      session[:player_id] = @player.id
      redirect_to player_path(@player) , :notice => "Signed up!"
        else
               flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
                render :action => 'new'
        end
    end
    
 

  def show
    @player = current_user
  end
  def new
    @player  = Player .new(:invitation_token => params[:invitation_token])
    @player .email = @player .invitation.recipient_email if @player.invitation


  #  @player = Player.new
  #@member = @player.build_member
  end
    def destroy
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:player_id])

    @member =  @team.members.where(:player_id => @player.id)
       
            @member.destroy
          redirect_to team_path(@team)
  end
end
