class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:show]
  
  def index
    @participants = Participant.order("points DESC")
  end

  def show
    
  end

  def new
    @participant = Participant.new
    @keywords = {
      name: "Enter",
      points: ["Enter", "Starting"],
      submit: "Create"
    }
  end
  
  def create
    @participant = Participant.new(participant_params)
    
    if @participant.save
      flash[:notice] = "Created Participant Successfully!"
      redirect_to participant_path(@participant)
    else
      @errors = []
      @participant.errors.full_messages.each do |m|
        @errors << m
      end
      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}""
      redirect_to new_participant_path
    end
    
  end

  def edit
    @keywords = {
      name: "Edit",
      points: ["Change", "Current"],
      submit: "Update"
    }
  end
  
  def update
    if @participant.update(participant_params)
      flash[:notice] = "Updated Participant Successfully!"
      redirect_to participant_path(@participant)
    else
      
      flash[:alert] = "An error has occurred when trying to update this participant."
      render 'edit'
    end
    
  end
  
  def destroy
    flash[:notice] = "Participant has been deleted!"
    @participant.destroy
  end
  
  private
  
    def set_participant
      @participant = Participant.friendly.find(params[:id])
    end
    
    def participant_params
      params.require(:participant).permit(:name, :points)
    end
end
