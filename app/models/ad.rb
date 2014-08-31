class Ad < ActiveRecord::Base
  has_many :clicks, dependent: :destroy
end
