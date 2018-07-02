class UsersController < ApplicationController
  before_action :set_user
  
  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
end
