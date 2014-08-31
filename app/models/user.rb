class User < ActiveRecord::Base
  has_many :videos, dependent: :destroy
  has_many :views, foreign_key: "viewed_by_id"
end
