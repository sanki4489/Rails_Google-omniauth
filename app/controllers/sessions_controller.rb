class SessionsController < ApplicationController
 
  #render log in form
  def new
    if logged_in?
      redirect_to root_path
    else 
  end

  #process render values
   def create # processing the login form
    # what do i need to do first?
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else 
      render :new
    end 
  end

  def destroy # logout 
    session.delete :user_id
    redirect_to login_path
  end
end
