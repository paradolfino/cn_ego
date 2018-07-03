class ParticipantsController < ApplicationController
  before_action :set_participant
  
  def index
    @participants = Participant.order("ASC points")
  end

  def show
  end

  def new
  end

  def edit
  end
end
