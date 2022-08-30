class KinderGarten < ApplicationRecord
  has_one :opening_hour
  has_many :bookmarks
end
