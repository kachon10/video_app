class AddDislikedByIdToDislikes < ActiveRecord::Migration
  def change
    add_column :dislikes, :disliked_by_id, :integer
  end
end
