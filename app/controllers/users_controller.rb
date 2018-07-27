class UsersController < ApplicationController
  before_action :set_user
  #before_action :authenticate_user
  
  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User Successfully Updated"
      redirect_to '/'
    else
      @errors = []
      @user.errors.full_messages.each do |m|
        @errors << m
      end
      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}"
      render 'edit'
    end
    
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :password, :password_confirmation)
    end
end
