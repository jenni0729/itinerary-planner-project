class UsersController < ApplicationController
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
    binding.pry
    if User.exists?(username: user_params[:username])
      @user = User.find_by(username: user_params[:username])
      binding.pry
      if @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          session[:username] = @user.username
          flash[:notice] = "Welcome #{@user.username}"
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
    flash[:notice] = "You are now logged out."
      redirect_to itineraries_path
  end 

private
  def user_params
  params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end
end
