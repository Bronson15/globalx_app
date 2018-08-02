module SessionsHelper

  #login specified participant
  def log_in(participant)
    session[:participant_id] = participant.id
  end

  #remembers participant in persistent session
  def remember(participant)
    participant.remember
    cookies.permanent.signed[:participant_id] = participant.id
    cookies.permanent[:remember_token] = participant.remember_token
  end

  def current_participant?(participant)    
    participant == current_participant
  end

  #returns logged in participant
  def current_participant
    if (participant_id = session[:participant_id])
      @current_participant ||= Participant.find_by(id: participant_id)
    elsif (participant_id = cookies.signed[:participant_id])
      participant = Participant.find_by(id: participant_id)
      if participant && participant.authenticated?(cookies[:remember_token])
        log_in participant
        @current_participant = participant
      end
    end
  end

  #boolean for if a participant is logged in
  def logged_in?
    !current_participant.nil?
  end

  def forget(participant)
    participant.forget
    cookies.delete(:participant_id)
    cookies.delete(:remember_token)
  end

  #log out current participant
  def log_out
    forget(current_participant)
    session.delete(:participant_id)
    @current_participant = nil
  end 

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if reguest.get?
  end
end
