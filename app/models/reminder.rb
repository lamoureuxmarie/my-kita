class Reminder < ApplicationRecord
  belongs_to :bookmark
  # has_one :user, through: :bookmark
  validates :title, :due_date, presence: true
  after_commit :async_notification

  def start_time
    self.due_date
  end

  private

  def async_notification
    SendTelegramMessageJob.perform_later(self)
  end
end
