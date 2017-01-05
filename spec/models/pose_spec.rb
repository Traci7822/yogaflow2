require 'rails_helper'

describe Pose do
  context "creates a new pose" do

  describe "has a valid sanskrit name" do
    it "is not blank" do
      pose = Pose.create(sanskrit_name: nil, english_name: 'Downward Dog')
      expect(pose).to be_invalid
    end
  end
  end
end
