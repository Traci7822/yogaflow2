class CreateSequencePoses < ActiveRecord::Migration
  def change
    create_table :sequence_poses do |t|
      t.integer "sequence_id"
      t.integer "pose_id"
      t.timestamps null: false
    end
  end
end
