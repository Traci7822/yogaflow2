require 'rails_helper'


describe Sequence do

  it {should have_many(:sequence_poses)}
  it {should have_many(:poses)}

  context "creates a new sequence" do

    describe "assigns a valid title" do
      it "is not blank" do
        sequence = Sequence.create(title: nil, difficulty: 3, repititions: 2)
        expect(sequence).to be_invalid
      end

      it "is unique" do
        sequence = Sequence.create(title: 'NewYogaSequence', difficulty: 3, repititions: 2)
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

      it "only has letters and spaces" do
        sequence = Sequence.create(title: '%^&123', difficulty: 3, repititions: 2)
        expect(sequence).to be_invalid
      end

    end

    describe "assigns a difficulty" do

      it "is not blank" do
        sequence = Sequence.create(title: 'NewYogaSequence', difficulty: nil, repititions: 2)
        expect(sequence).to be_invalid
      end

      it "has a difficulty level between 1 and 5" do
        sequence1 = Sequence.create(title: 'NewYogaSequence', difficulty: 0, repititions: 2)
        sequence2 = Sequence.create(title: 'NewYogaSequence', difficulty: 10, repititions: 2)
        expect(sequence2).to be_invalid
        expect(sequence2).to be_invalid
      end

    end

    describe "assigns repititions" do

      it "is not blank" do
        sequence = Sequence.create(title: 'NewYogaSequence', difficulty: 3, repititions: nil)
        expect(sequence).to be_invalid
      end

      it "has between 1 and 10 repititions" do
        sequence1 = Sequence.create(title: 'NewYogaSequence', difficulty: 3, repititions: 0)
        sequence2 = Sequence.create(title: 'NewYogaSequence', difficulty: 3, repititions: 20)
        expect(sequence2).to be_invalid
        expect(sequence2).to be_invalid
      end
    end

    describe "assigns poses" do
      before(:each) do

        Pose.create(
          sanskrit_name: "Urdhva Vrikshasane",
          english_name: "Upward Tree Position"
        )
        Pose.create(
          sanskrit_name: "Uttanasana",
          english_name: "Standing Forward Fold"
        )
        Pose.create(
          sanskrit_name: "Ardha Uttanasana",
          english_name: "Half Standing Forward Fold"
        )
        Pose.create(
          sanskrit_name: "Chaturanga Dandasana",
          english_name: "Low Plank"
        )
        Pose.create(
          sanskrit_name: "Eka Pada Tadasana",
          english_name: "One-Legged Mountain"
        )
        Pose.create(
          sanskrit_name: "Ardha Matsyendrasana",
          english_name: "Half Lord of the Fishes"
        )
        Pose.create(
          sanskrit_name: "Bakasana",
          english_name: "Crow"
        )
        Pose.create(
          sanskrit_name: "Astavakrasana",
          english_name: "Eight-Angle"
        )
        Pose.create(
          sanskrit_name: "Garudasana",
          english_name: "Eagle"
        )
        Pose.create(
          sanskrit_name: "Utthita Hasta Padangustasana",
          english_name: "Extended Hand-To-Big-Toe"
        )
        Pose.create(
          sanskrit_name: "Ardha Chandrasana",
          english_name: "Half Moon"
        )
        Pose.create(
          sanskrit_name: "Adho Mukha Vrksasana",
          english_name: "Handstand"
        )
        Pose.create(
          sanskrit_name: "Vasisthasana",
          english_name: "Side Plank"
        )
        Pose.create(
          sanskrit_name: "Salamba Sirsasana",
          english_name: "Supported Headstand"
        )
        Pose.create(
          sanskrit_name: "Salmba Sarvangasana",
          english_name: "Supported Shoulderstand"
        )
        Pose.create(
          sanskrit_name: "Vrksasana",
          english_name: "Tree"
        )
        Pose.create(
          sanskrit_name: "Virachadrasana III",
          english_name: "Warrior III"
        )
      end

      let(:sequence) {Sequence.new(
        title: "NewYogaSequence",
        difficulty: 3,
        repititions: 5
      )}

      let(:poses) {
          {poses_attributes:
            {"0"=>{:sanskrit_name => "", :english_name => ""},
            "1"=>{:sanskrit_name => "", :english_name => ""},
            "2"=>{:sanskrit_name => "", :english_name => ""},
            "3"=>{:sanskrit_name =>"weeeeee", :english_name =>"eeeeew"},
            "4"=>{:sanskrit_name => "", :english_name => ""},
            "5"=>{:sanskrit_name => "yupyup", :english_name => "nopenope"},
            "6"=>{:sanskrit_name => "", :english_name => ""},
            "7"=>{:sanskrit_name => "", :english_name => ""},
            "8"=>{:sanskrit_name => "", :english_name => ""},
            "9"=>{:sanskrit_name => "", :english_name => ""}},
          pose_ids:
            ["8", "9", "15", "new", "9", "new", "7", "16", "9", "2"]
          }
        }

      before(:each) do
        sequence.set_sequence_poses(poses)
      end

      it "adds existing poses to the sequence" do
        expect(sequence.poses.length).to eq(10)
      end

      it "adds new poses to the sequence" do
        expect(sequence.poses[3].sanskrit_name).to eq("weeeeee")
      end

      it "adds poses to the sequence in the correct order" do
        expect(sequence.pose_ids).to eq( [8, 9, 15, 16, 9, 17, 7, 16, 9, 2])
      end
    end
  end
end
