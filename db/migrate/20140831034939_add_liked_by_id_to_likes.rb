class AddLikedByIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :liked_by_id, :integer
  end
end
