class Pose < ActiveRecord::Base
  has_many :sequence_poses
  has_many :sequences, through: :sequence_poses
  validates :sanskrit_name, presence: true, uniqueness: true
  validates_format_of :sanskrit_name, :with => /^[a-zA-Z\s]*$/, :multiline => true
  validates :english_name, presence: true, uniqueness: true
  validates_format_of :english_name, :with => /^[a-zA-Z\s]*$/, :multiline => true

  def display_name
    "#{self.sanskrit_name}" + " - " + "#{self.english_name}"
  end
end
