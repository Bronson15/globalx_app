class TripsController < ApplicationController
  before_action :logged_in_admin, only: :new
  before_action :admin_user, only: [:create, :destroy]

  def index
    @trips = Trip.paginate(page: params[:page])
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:success] = "Trip created!"
      redirect_to @trip
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:success] = "Trip updated"
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:success] = "Trip deleted"
    redirect_to trips_url
  end

  private

    #only allow these params. prevents giving URL queries that could mess with app.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :location)
    end

    def admin_user
      redirect_to(root_url) unless current_participant.admin?
    end

    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
