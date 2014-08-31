class Click < ActiveRecord::Base
  belongs_to :ad
  belongs_to :prerolled_by, class_name: "Video"
end
