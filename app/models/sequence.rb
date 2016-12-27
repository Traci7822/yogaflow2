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

  def set_sequence_poses(params)
    @sequence_poses_array = []
    params.each do |attribute|
      if attribute[0] == "pose_ids"
        attribute[1].each_with_index do |pose_id, i|
          if pose_id != ""
            if pose_id == "new"
              @new_pose_names = params[:poses_attributes].values[i]
              if valid_entry?(@new_pose_names)
                create_new_pose(@new_pose_names, @sequence_poses_array, i)
              end
            else
              add_existing_pose(pose_id, @sequence_poses_array, i)
            end
          end
        end
      end
    end
  end

  def create_new_pose(pose_names, sequence, index)
    @new_pose = Pose.find_or_create_by(sanskrit_name: pose_names[:sanskrit_name], english_name: pose_names[:english_name])
    @new_pose.save
    sequence[index] = @new_pose
  end

  def add_existing_pose(pose_id, sequence, index)
    sequence[index] = Pose.find(pose_id)
  end

  def valid_entry?(attribute_hash)
    attribute_hash.each do |k, v|
      if v == ""
        false
        # throw error, names cannot be blank
      end
    end
  end

end
