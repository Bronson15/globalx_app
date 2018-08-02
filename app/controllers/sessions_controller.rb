class SessionsController < ApplicationController
  def new
  end

  #create the session for login
  def create

    #if the participant info is authenticated, then create the session
    participant = Participant.find_by(email: params[:session][:email].downcase)
    if participant && participant.authenticate(params[:session][:password])
      log_in participant
      params[:session][:remember_me] == '1' ? remember(participant) : forget(participant)
      redirect_back_or participant
    #else alert the user that the provided info was wrong  
    else
      flash.now[:danger] = 'Invalid credentials.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
