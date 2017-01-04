require 'rails_helper'

describe Sequence do
  context "creates a new sequence" do

    describe "assigns a valid title" do
      it "is not blank" do
        Sequence.create(title: nil, difficulty: 3, repititions: 2).should_not be_valid
      end
    end
  end
end
