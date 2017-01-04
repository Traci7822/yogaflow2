require 'rails_helper'

describe Sequence do
  context "creates a new sequence" do

    describe "assigns a valid title" do
      it "is not blank" do
        sequence = Sequence.create(title: nil, difficulty: 3, repititions: 2)
        expect(sequence).to be_invalid
      end
      it "is unique" do
        sequence = Sequence.create(title: 'NewYogaSequence', difficulty: 3, repititions: 2)
        expect(sequence).to be_valid
        expect(sequence.dup).to be_invalid
      end
      it "is long enough" do
        sequence = Sequence.create(title: 'New', difficulty: 3, repititions: 2)
        expect(sequence).to be_invalid
      end
      it "isn't too long" do
        sequence = Sequence.create(title: 'NewYogaSequence123456789012345678901234567890', difficulty: 3, repititions: 2)
        expect(sequence).to be_invalid
      end
    end

    describe "assigns a difficulty" do
      it "is not blank" do
        sequence = Sequence.create(title: 'NewYogaSequence', difficulty: nil, repititions: 2)
        expect(sequence).to be_invalid
      end
      it "is has a difficulty level between 1 and 5" do
        sequence1 = Sequence.create(title: 'NewYogaSequence', difficulty: 0, repititions: 2)
        sequence2 = Sequence.create(title: 'NewYogaSequence', difficulty: 10, repititions: 2)
        expect(sequence2).to be_invalid
        expect(sequence2).to be_invalid
      end
    end
  end
end
