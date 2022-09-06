class Bookmark < ApplicationRecord
  belongs_to :kinder_garten
  belongs_to :user
  has_many :reminders
  has_many :templates
end
