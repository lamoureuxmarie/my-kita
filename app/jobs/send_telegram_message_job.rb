class SendTelegramMessageJob < ApplicationJob
  queue_as :default

  def perform(chat_id, reminder)
    # Do something later
    sleep 2
    HTTParty.post("https://api.telegram.org/bot#{ENV['TELEGRAM']}/sendMessage?chat_id=#{chat_id}&text=Upcoming event: #{reminder.title}%0ASubject: #{reminder.content}%0ADue date: #{reminder.due_date}")
  end
end
