class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  
  def index
    @participants = Participant.order("ASC points")
  end

  def show
    
  end

  def new
    @participant = Participant.new
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
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
    def set_participant
      @participant = Participant.find(params[:id])
    end
    
    def participant_params
      params.require(:participant).require(:name, :points)
    end
end
