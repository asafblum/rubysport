class SessionsController < ApplicationController
  def new
  end

 def create
  player = Player.find_by_email(params[:email])
  if player && player.authenticate(params[:password])
    session[:player_id] = player.id
    redirect_to player_url(player), :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end



  def destroy
    session[:player_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

