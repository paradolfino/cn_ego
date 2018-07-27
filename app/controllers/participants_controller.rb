class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy, :inc, :dec]
  #before_action :authenticate_user, except: [:show]
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
    redirect_to participants_path
  end
  
  def dec
    @participant.decrement!(:points, by=@amount)
    redirect_to participants_path
  end

  def import
    redirect_to root_path
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
