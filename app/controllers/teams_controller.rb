class TeamsController < ApplicationController
  #http_basic_authenticate_with :name => "frodo", :password => "thering"
  # GET /teams
  # GET /teams.json
  def index
    if (current_user)


    @teams = current_user.teams

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
    else
        redirect_to root_url , notice: 'Not Logged in.'
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    if (current_user)
    #@team = Team.find(params[:id])
    @team  = current_user.teams.find_by_id(params[:id])
    if @team


      @member = @team.members.find_by_player_id(current_user.id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
    else 
        redirect_to teams_url , notice: 'Not a member of this group.'
    end
    else 
        redirect_to root_url , notice: 'Not Logged in.'
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
    @player = current_user
    @member = @team.members.new(params[:member])
    @member.player_id = @player.id
    @member.is_admin = true
    @member.save
    
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :ok }
    end
  end
end
