# require 'telegram/bot'

class RemindersController < ApplicationController
  before_action :find_reminder, only: %i[show edit update destroy]
  before_action :find_bookmark, only: %i[new create]

  def index
    @reminders = Reminder.all
  end

  def show
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.bookmark = @bookmark
    if @reminder.save
      SendTelegramMessageJob.perform_now(current_user.chat_id, @reminder) if current_user.chat_id.present?
      redirect_to reminders_path
    else
      render :new, notice: "Oops. Something went wrong..."
    end
  end

  # def message
  #   # Telegram.bot.send_message
  #   HTTParty.post("https://api.telegram.org/bot#{ENV['TELEGRAM']}/sendMessage?chat_id=1789513066&text=Upcoming event: #{Reminder.last.title}%0ASubject: #{Reminder.last.content}%0ADue date: #{Reminder.last.due_date}")
  #   redirect_to reminders_path, notice: "Success"
  # end

  def edit
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to bookmark_path(:bookmark_id), notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @reminder.destroy
    redirect_to reminders_path, status: :see_other
  end

  private

  def find_reminder
    @reminder = Reminder.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(:title, :content, :due_date)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end
end
