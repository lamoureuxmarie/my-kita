class KinderGarten < ApplicationRecord
  has_one :opening_hour
  has_one :bookmark
  validates :name, :address, presence: true
end
