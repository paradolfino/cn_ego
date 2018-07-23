require 'rails_helper'

RSpec.describe Participant, type: :model do
  context Participant do
    it "should validate presence of name" do
        participant = Participant.new(points: 10).save
        expect(participant).to eq(false)
    end
    
    it "should validate presence of points" do
        participant = Participant.new(name: "Able").save
        expect(participant).to eq(false)
    end
    
    it "should be a number" do
        participant = Participant.create(name: "able", points: 1)
        expect(participant).to be_invalid
    end
  
  end
  
end
