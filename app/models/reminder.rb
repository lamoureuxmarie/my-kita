class Reminder < ApplicationRecord
  belongs_to :bookmark
  validates :title, :due_date, presence: true

  def start_time
    self.reminder.due_date
  end
end
