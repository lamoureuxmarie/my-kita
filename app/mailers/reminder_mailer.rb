class ReminderMailer < ApplicationMailer
  default from: 'contact@my-kita.xyz'

  def reminder_mailer
    @user = params[:user]
    @reminder = params[:reminder]
    @url = 'https://www.my-kita.xyz/reminders'
    mail(from: "Marie <contact@my-kita.xyz>",
         to: User.last.email,
         subject: 'Reminder')
  end
end
