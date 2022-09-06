class ReminderMailer < ApplicationMailer
  default from: 'contact@my-kita.xyz'

  def send_message(reminder)
    # Telegram.bot.send_message
    HTTParty.post("https://api.telegram.org/bot#{ENV['TELEGRAM']}/sendMessage?chat_id=#{chat_id}&text=Upcoming event: #{reminder.title}%0ASubject: #{reminder.content}%0ADue date: #{reminder.due_date}")
  end
end
