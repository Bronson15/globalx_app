class ParticipantsController < ApplicationController
  before_action :logged_in_participant, only: [:edit, :update]
  before_action :correct_participant,   only: [:edit, :update]

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

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(participant_params)
      flash[:success] = "Profile updated"
      redirect_to @participant
    else
      render 'edit'
    end
  end

  private

    #only allow these params. prevents giving URL queries that could mess with app.
    def participant_params
      params.require(:participant).permit(:first_name, :last_name, :email, :phone_number,
                                            :address, :address2, :city, :state, :zip, :birthdate,
                                            :password, :password_confirmation, :picture)
    end

    def logged_in_participant
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_participant
      @participant = Participant.find(params[:id])
      redirect_to(root_url) unless current_participant?(@participant)
    end
end
