class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy, :inc, :dec]
  # before_action :authenticate_user, except: [:show]
  before_action :sanitize_amt, only: [:inc, :dec]
  
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
      redirect_to participants_path
    else
      @errors = []
      @participant.errors.full_messages.each do |m|
        @errors << m
      end
      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}"
      redirect_to :new
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
      redirect_to participants_path
    else
      @errors = []
      @participant.errors.full_messages.each do |m|
        @errors << m
      end
      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}"
      redirect_to edit_participant_path(@participant)
    end
    
  end
  
  def destroy
    @participant.destroy
    
    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
  
  def inc
    @participant.increment!(:points, by=@amount)
    flash[:notice] = "#{@participant.name}'s points increased by #{@amount}."
    redirect_to participants_path
  end
  
  def dec
    @participant.decrement!(:points, by=@amount)
    flash[:notice] = "#{@participant.name}'s points decreased by #{@amount}."
    redirect_to participants_path
  end

  def import
    parts = Participant.all.count
    Participant.import(params[:file])
    if Participant.all.count <= parts
      flash[:alert] = "There was an error with importing these participants. Make sure they don't already exist or that the file is in the correct format."
      redirect_to participants_path
    else
      flash[:notice] = "Participants imported!"
      redirect_to participants_path

    end


  end
  
  private
  
    def set_participant
      @participant = Participant.friendly.find(params[:id])
    end
    
    def participant_params
      params.require(:participant).permit(:name, :points)
    end
    
    def sanitize_amt
      amount = params[:amount].to_i
      @amount = amount
      puts "points #{@amount}"
    end
end
