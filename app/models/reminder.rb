class Reminder < ApplicationRecord
  belongs_to :bookmark
  # has_one :user, through: :bookmark
  validates :title, :due_date, presence: true

  def start_time
    self.due_date
  end
end
