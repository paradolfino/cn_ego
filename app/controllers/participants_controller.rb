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
