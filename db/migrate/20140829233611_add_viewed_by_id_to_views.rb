class AddViewedByIdToViews < ActiveRecord::Migration
  def change
    add_column :views, :viewed_by_id, :integer
  end
end
