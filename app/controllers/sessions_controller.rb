class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id 
          flash[:success] = 'Logged in!'
          redirect_to "/"
      else
          flash[:danger] = 'There was something wrong with your credentials.'
          render 'new'
      end
  end

  def destroy
      session[:user_id] = nil
      flash[:success] = 'Logged out!'
      redirect_to "/"
  end
end
