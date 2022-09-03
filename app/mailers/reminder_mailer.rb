class ReminderMailer < ApplicationMailer
  default from: 'contact@my-kita.xyz'

  def reminder_email
    @user = params[:user]
    @url = 'https://www.my-kita.xyz/reminders'
    mail(to: @user.email, subject: 'Reminder')
  end
end
