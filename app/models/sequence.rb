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
              if @new_pose_names.values[0] != "" || @new_pose_names.values[1] != ""
                @new_pose = Pose.find_or_create_by(sanskrit_name: @new_pose_names[:sanskrit_name], english_name: @new_pose_names[:english_name])
                @new_pose.save
                @sequence_poses_array[i] = @new_pose
              else
                # throw error, names cannot be blank
              end
            else
              @sequence_poses_array[i] = Pose.find(pose_id)
            end
          end
        end
      end
    end
  end


end
