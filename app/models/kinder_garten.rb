class KinderGarten < ApplicationRecord
  has_one :opening_hour
  has_many :bookmarks
  validates :name, :address, presence: true
end
