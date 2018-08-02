class TripsController < ApplicationController

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

  private

    #only allow these params. prevents giving URL queries that could mess with app.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :location)
    end
end
