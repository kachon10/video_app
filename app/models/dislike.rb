class Dislike < ActiveRecord::Base
  belongs_to :video
  belongs_to :disliked_by, class_name: "User"
end
