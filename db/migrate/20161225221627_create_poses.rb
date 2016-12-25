class CreatePoses < ActiveRecord::Migration
  def change
    create_table :poses do |t|
      t.string "sanskrit_name"
      t.string "english_name"
      t.timestamps null: false
    end
  end
end
