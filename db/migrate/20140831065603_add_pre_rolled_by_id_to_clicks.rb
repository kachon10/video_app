class AddPreRolledByIdToClicks < ActiveRecord::Migration
  def change
    add_column :clicks, :prerolled_by_id, :integer
  end
end
