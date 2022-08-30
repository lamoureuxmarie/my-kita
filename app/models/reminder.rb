class Reminder < ApplicationRecord
  belongs_to :bookmark
  validates :title, :due_date, presence: true
end
