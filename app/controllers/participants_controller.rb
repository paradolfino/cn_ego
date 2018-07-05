class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  
  def index
    @participants = Participant.order("ASC points")
  end

  def show
    
  end

  def new
    @participant = Participant.new
    @keywords = {
      name: "Enter",
      points: ["Change", "Current"],
      submit: "Update"
    }
  end
  
  def create
    @participant = Participant.new(participant_params)
    
    if @participant.save
      flash[:notice] = "Created Participant Successfully!"
      redirect_to participant_route(@participant)
    else
      flash[:alert] = "An error has occurred when trying to create this participant. Make sure all fields are filled out."
      render 'new'
    end
  end

  def edit
    @keywords = {
      name: "Edit",
      points: ["Enter", "Starting"],
      submit: "Create"
    }
  end
  
  def update
    if @participant.update(participant_params)
      flash[:notice] = "Updated Participant Successfully!"
      redirect_to participant_route(@participant)
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
      params.require(:participant).require(:name, :points)
    end
end
