# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailer
class ReminderMailerPreview < ActionMailer::Preview
  def reminder_mailer
    ReminderMailer.with(user: User.last, reminder: Reminder.last).reminder_mailer
  end
end
