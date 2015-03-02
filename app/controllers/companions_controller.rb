class CompanionsController < ApplicationController
  
  before_action :check_is_activity
  before_action :find_companion, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def new
    unless Companion.exists?(email: session[:email])
      Companion.new

    end
  end

  def index
    @companion = Companion.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def check_is_activity
    if companion_params[:activity_id] == nil
      is_activity == nil
    end 
  end

  def find_companion
    @companion = Companion.find params[:id]
  end

  private

  def companion_params
    params.require(:user).permit(:email, :first_name, :last_name, :activity_id, :companion_id, :itinerary_id)
  end 

end
