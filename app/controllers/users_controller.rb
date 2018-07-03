class UsersController < ApplicationController
  before_action :set_user
  
  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User Successfully Updated"
      redirect_to '/'
    else
      flash[:alert] = "An error has occurred!"
      render 'edit'
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.permit(:name, :email, :password)
    end
end
