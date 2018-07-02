class SessionsController < ApplicationController
  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id 
          flash.now[:success] = 'Logged in!'
          redirect_to "/"
      else
          flash.now[:danger] = 'There was something wrong with your credentials.'
          render 'new'
      end
  end

  def destroy
      session[:user_id] = nil
      flash.now[:success] = 'Logged out!'
      redirect_to "/"
  end
end
