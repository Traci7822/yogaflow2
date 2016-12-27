class Sequence < ActiveRecord::Base
  has_many :sequence_poses
  has_many :poses, through: :sequence_poses
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :difficulty, presence: true
  validates :repititions, presence: true

  def poses_attributes=(poses_attributes)
    poses_attributes.each do |i, pose_attributes|
      if pose_attributes.values.first == "" || pose_attributes.values.last == ""
      else
        self.poses.build(pose_attributes)
      end
    end
  end
  
end
