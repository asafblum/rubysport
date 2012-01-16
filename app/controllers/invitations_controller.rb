class InvitationsController < ApplicationController
  def new
  @invitation = Invitation.new
  @invitation.team_id = params[:team_id]
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitation  }
      end
  end

def create
  @invitation = Invitation.new(params[:invitation])
  
      if current_user
        @invitation.sender = current_user
      end
  @invitation.sent_at = Time.now
  if @invitation.save


    PlayerMailer.invitation_confirmation(@invitation).deliver

      
      redirect_to root_url, :notice => "Thank you, we will notify when we are ready."
      #redirect_to root_url, :notice =>
   
  else
    render :action => 'new'
  end
end
end
