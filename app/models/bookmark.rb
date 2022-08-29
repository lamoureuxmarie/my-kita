class Bookmark < ApplicationRecord
  belongs_to :kita
  belongs_to :user
  has_many :reminders
end
