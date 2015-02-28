class ActivitiesController < ApplicationController

  def index
    @itinerary = Itinerary.find params[:itinerary_id]
    @activities = @itinerary.activities
  end

  def show
  end

  def edit
  end

  def new
  end


end
