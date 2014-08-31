class Video < ActiveRecord::Base
  belongs_to :user
  has_many :views, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  
  def as_json(options = {})
    ret = super
    ret['view_count'] = views.count
    ret['like_count'] = likes.count
    ret['dislike_count'] = dislikes.count
    ret
  end
end
