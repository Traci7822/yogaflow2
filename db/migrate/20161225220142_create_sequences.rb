class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string "title"
      t.integer "difficulty"
      t.integer "repititions"
      t.timestamps null: false
    end
  end
end
