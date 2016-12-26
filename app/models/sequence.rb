class Sequence < ActiveRecord::Base
  has_many :sequence_poses
  has_many :poses, through: :sequence_poses
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :difficulty, presence: true
  validates :repititions, presence: true
end
