class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :video_id

      t.timestamps
    end
  end
end
