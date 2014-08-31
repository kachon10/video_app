class View < ActiveRecord::Base
  belongs_to :video
  belongs_to :viewed_by, class_name: "User"
end
