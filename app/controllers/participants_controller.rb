class ParticipantsController < ApplicationController

  #show all registered participants
  def show
    @participant = Participant.find(params[:id])
  end

  #make a new participant
  def new
    @participant = Participant.new
  end

  #participant signup for the app
  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      log_in @participant
      flash[:success] = "Welcome to the global(x) app!"
      redirect_to @participant
    else
      render 'new'
    end
  end

  private

    #only allow these params. prevents giving URL queries that could mess with app.
    def participant_params
      params.require(:participant).permit(:first_name, :last_name, :email, :phone_number,
                                            :address, :address2, :city, :state, :zip, :birthdate,
                                            :password, :password_confirmation, :picture)
    end
end
