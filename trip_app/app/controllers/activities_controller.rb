class ActivitiesController < ApplicationController

  before_action :find_itinerary, only: [:index, :new, :show, :edit, :create, :update, :destroy]

  def index
    binding.pry
    @activities = @itinerary.activities
  end

  def new
    @activity = Activity.new
  end

  def show
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

  private

  def find_itinerary
    @itinerary = Itinerary.find params[:itinerary_id]
  end

  def activity_params
    params.require(:activity).permit(:name, :location, :date, :itinerary_id)
  end



end
