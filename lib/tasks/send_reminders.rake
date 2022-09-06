namespace :send_reminders do
  desc "Send reminders (async)"
  task send_all: :environment do
    tomorrow = Date.tomorrow.in_time_zone("UTC")
    reminders = Reminder.where(due_date: tomorrow..tomorrow.end_of_day)
    puts "Enqueuing jobs of #{reminders.size} reminders..."
    reminders.each do |reminder|
      SendTelegramMessageJob.perform_later(reminder.bookmark.user.chat_id, reminder)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
