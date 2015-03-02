class ItinerariesController < ApplicationController

  before_action :find_itinerary, only: [:show, :edit, :update]

  def index
    @itineraries = User.find(session[:user_id]).itineraries
  end

  def new
    @itinerary = Itinerary.new
  end

  def show
    @itinerary_owner = User.find @itinerary.user_id
    @reviews = @itinerary.reviews
    # @users and @user are needed for add companion dropdown
    @users = User.all
    @user = User.new
  end

  def edit
    @itinerary_owner = User.find @itinerary.user_id
  end

  def create
    @itinerary = Itinerary.new itinerary_params
    if @itinerary.save
      @user = User.find(session[:user_id])
      @user.itineraries << @itinerary
      redirect_to itineraries_path
    else
      if session[:user_id] == nil
        flash.now[:alert] = "Please Login"
      else
        flash.now[:alert] = "Please correct the following input errors"
      end
      render :new
    end
  end

  def update
    @itinerary.update_attributes itinerary_params
    if @itinerary.save
      redirect_to itinerary_path(@itinerary)
    else
      flash.now[:alert] = "Please correct the following input errors"
      render :edit
    end
  end

  def destroy
    puts "session user_id #{session[:user_id]}"
    puts "itinerary user _id #{itinerary[:user_id]}"
    itinerary = Itinerary.find params[:id] # No need for instance var here #
    if session[:user_id] != itinerary[:user_id]
      flash[:alert] = "You are not authorized to delete this itinerary"
      redirect_to itineraries_path
    else
    itinerary.destroy
    redirect_to itineraries_path
    end
  end

  private

  def find_itinerary
    @itinerary = Itinerary.find params[:id]
  end

  def itinerary_params
    params.require(:itinerary).permit(:name, :origin, :destination, :departure_date, :return_date, :user_id)
  end

end
