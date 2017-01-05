require 'rails_helper'

describe Pose do

  it {should have_many(:sequence_poses)}
  it {should have_many(:sequences)}

  context "creates a new pose" do

    describe "has a valid sanskrit name" do

      it "is not blank" do
        pose = Pose.create(sanskrit_name: nil, english_name: 'Downward Dog')
        expect(pose).to be_invalid
      end

      it "only has letters and spaces" do
        pose = Pose.create(sanskrit_name: '%$/sanskrit()', english_name: 'Downward Dog')
        expect(pose).to be_invalid
      end

    end

    describe "has a valid english name" do

      it "is not blank" do
        pose = Pose.create(sanskrit_name: 'Adho Mukha Svanasana', english_name: nil)
        expect(pose).to be_invalid
      end

      it "only has letters and spaces" do
        pose = Pose.create(sanskrit_name: 'Adho Mukha Svanasana', english_name: '^93Downward#Dog')
        expect(pose).to be_invalid
      end

    end

    describe "is a new pose" do

      it "is unique" do
        pose = Pose.create(sanskrit_name: 'Adho Mukha Svasana', english_name: 'Downward Dog')
        expect(pose.dup).to be_invalid
      end

    end

  end
end
