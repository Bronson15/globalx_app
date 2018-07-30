class ParticipantsController < ApplicationController

  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      flash[:success] = "Welcome to the global(x) app!"
      redirect_to @participant
    else
      render 'new'
    end
  end

  private

    def participant_params
      params.require(:participant).permit(:first_name, :last_name, :email, :phone_number,
                                            :address, :address2, :city, :state, :zip, :birthdate,
                                            :password, :password_confirmation)
    end
end
