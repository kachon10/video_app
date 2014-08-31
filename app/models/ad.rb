class Ad < ActiveRecord::Base
  has_many :clicks, dependent: :destroy

  def as_json(options = {})
    ret = super
    ret['click_count'] = clicks.count
    ret
  end
end
