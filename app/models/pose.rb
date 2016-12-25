class Pose < ActiveRecord::Base
  has_many :sequence_poses
  has_many :sequences, through: :sequence_poses

  def display_name
    "#{self.sanskrit_name}" + " - " + "#{self.english_name}"
  end
end
