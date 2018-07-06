class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user
  
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
    @resource = @user
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :password, :password_confirmation)
    end
end
