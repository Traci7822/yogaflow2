class Pose < ActiveRecord::Base
  has_many :sequence_poses
  has_many :sequences, through: :sequence_poses
  validates :sanskrit_name, presence: true

  def display_name
    "#{self.sanskrit_name}" + " - " + "#{self.english_name}"
  end
end
