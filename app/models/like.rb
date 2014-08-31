class Like < ActiveRecord::Base
  belongs_to :video
  belongs_to :liked_by, class_name: "User"
end
