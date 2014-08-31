class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.string :ad_id

      t.timestamps
    end
  end
end
