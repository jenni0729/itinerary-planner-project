class ActivitiesController < ApplicationController

  before_action :find_itinerary, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :find_activity, only: [:edit, :update, :show, :destroy]

  def index
    @activities = @itinerary.activities
  end

  def new
    @activity = Activity.new
  end

  def show
    @itinerary_owner = User.find @itinerary.user_id
    @reviews = @activity.reviews
  end

  def edit
  end

  def create
    @activity = Activity.new activity_params
    if @activity.save
      redirect_to itinerary_activities_path(@itinerary)
    else
      flash.now[:alert] = "Please correct the following input errors"
      render :new
    end
  end

  def update
    @activity.update_attributes activity_params
    if @activity.save
      redirect_to itinerary_activity_path(@itinerary, @activity)
    else
      flash.now[:alert] = "Please correct the following input errors"
      render :edit
    end
  end

  def destroy
    # Note: The instance variables are both needed for redirection
    if session[:user_id] != itinerary[:user_id]
      flash[:alert] = "You are not authorized to delete this activity"
      redirect_to itinerary_activity_path(@itinerary, @activity)
    else
      activity.destroy
      redirect_to itinerary_activities_path(@itinerary)
    end
  end

  private

  def find_itinerary
    @itinerary = Itinerary.find params[:itinerary_id]
  end

  def find_activity
    @activity = Activity.find params[:id]
  end

  def activity_params
    params.require(:activity).permit(:name, :location, :date, :itinerary_id)
  end



end
