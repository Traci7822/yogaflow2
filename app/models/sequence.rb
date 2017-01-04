class Sequence < ActiveRecord::Base
  has_many :sequence_poses
  has_many :poses, through: :sequence_poses
  validates :title, presence: true, uniqueness: true, length: {minimum: 5, maximum: 30}
  validates :difficulty, presence: true
  validates_inclusion_of :difficulty, :in => 1..5
  validates :repititions, presence: true

  def poses_attributes=(poses_attributes)
    poses_attributes.each do |i, pose_attributes|
      if pose_attributes.values.first.empty? || pose_attributes.values.last.empty?
      else
        self.poses.build(pose_attributes)
      end
    end
  end

  def set_sequence_poses(params)
    sequence_poses_array = []
    params[:pose_ids].each_with_index do |pose_id, i|
      if !pose_id.empty?
        if new_pose?(pose_id)
          new_pose_names = params[:poses_attributes].values[i]
          if valid_entry?(new_pose_names)
            create_new_pose(new_pose_names, sequence_poses_array, i)
          end
        else
          add_existing_pose(pose_id, sequence_poses_array, i)
        end
      end
    end
    self.poses = sequence_poses_array
  end

  def create_new_pose(pose_names, sequence, index)
    new_pose = Pose.find_or_create_by(sanskrit_name: pose_names[:sanskrit_name], english_name: pose_names[:english_name])
    new_pose.save
    sequence[index] = new_pose
  end

  def add_existing_pose(pose_id, sequence, index)
    sequence[index] = Pose.find(pose_id)
  end

  def valid_entry?(attribute_hash)
    attribute_hash.each do |k, v|
      if v.empty?
        false
        # throw error, names cannot be blank
      end
    end
  end

  private

  def new_pose?(pose_id)
    pose_id == "new"
  end

end
