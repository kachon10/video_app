class CreateDislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :video_id

      t.timestamps
    end
  end
end
