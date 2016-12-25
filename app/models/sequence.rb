class Sequence < ActiveRecord::Base
  has_many :sequence_poses
  has_many :poses, through: :sequence_poses
end
