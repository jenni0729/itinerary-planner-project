class UsersController < ApplicationController

  before_action :find_user, only: [:add_itinerary, :remove_itinerary, :add_activity, :remove_activity]
  before_action :find_itinerary, only: [:add_itinerary, :remove_itinerary, :add_activity, :remove_activity]
  before_action :find_activity, only: [:add_activity, :remove_activity]

  def login
    @user = User.new
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to login_path
    else
      flash.now[:notice] = "Please try again!!"
      render :signup
    end
  end

  def attempt_login
    if User.exists?(username: user_params[:username])
      @user = User.find_by(username: user_params[:username])
      if @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          session[:username] = @user.username
          session[:first_name] = @user.first_name
          flash[:notice] = "Welcome #{@user.first_name}"
          redirect_to itineraries_path
      else
        flash[:notice] = "Incorrect Password"
        redirect_to login_path
      end
    else
      flash[:notice] = "Username not found"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:first_name] = nil
    flash[:notice] = "You are now logged out."
      redirect_to login_path
  end

  def add_itinerary
    @itinerary.users << @user
    redirect_to itinerary_path(@itinerary)
  end

  def remove_itinerary
    @itinerary.users.delete(@user)
    redirect_to itinerary_path(@itinerary)
  end

  def add_activity
    @activity.users << @user
    redirect_to itinerary_activity_path(@itinerary, @activity)
  end

  def remove_activity
    @activity.users.delete(@user)
    redirect_to itinerary_activity_path(@itinerary, @activity)
  end
  def join
    @user = User.new
    @itinerary = Itinerary.find(params[:id])
  end
private

  def find_user
    @user = User.find params[:user][:id]
  end

  def find_itinerary
    @itinerary = Itinerary.find params[:itinerary_id]
  end

  def find_activity
    @activity = Activity.find params[:activity_id]
  end

  def user_params
    params.require(:user).permit(:id, :username, :password, :email, :first_name, :last_name)
  end

end
