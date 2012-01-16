class EventsController < ApplicationController
  def create
    #@location = Location.find(:location_id)
    @team = Team.find(params[:team_id])
    @event = @team.events.create(params[:event])

          redirect_to team_path(@team)
  end

  def show
    @event = Event.find(params[:id])

    @json = @event .location.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  #  def destroy
   # @member = Member.find(params[:id])
   # @team = Team.find(@member.team_id)
   # @member.destroy
#redirect_to team_path(@team)

  #  end



end
