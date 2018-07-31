module SessionsHelper

  #login specified participant
  def log_in(participant)
    session[:participant_id] = participant.id
  end

  #returns logged in participant
  def current_participant
    @current_participant ||= Participant.find_by(id: session[:participant_id])
  end

  #boolean for if a participant is logged in
  def logged_in?
    !current_participant.nil?
  end

  #log out current participant
  def log_out
    session.delete(:participant_id)
    @current_participant = nil
  end 
end
