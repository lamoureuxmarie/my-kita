# require 'telegram/bot'

class RemindersController < ApplicationController
  before_action :find_reminder, only: %i[show edit update destroy]
  before_action :find_bookmark, only: %i[new create]
  skip_after_action :verify_authorized, only: %i[message]

  def index
    @reminders = policy_scope(Reminder)
    start_date = params.fetch(:due_date, Date.today).to_date
    # Need to specify current_user
    bookmark_ids = current_user.bookmarks.ids
    @reminders = Reminder.where(due_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @reminders = @reminders.select { |reminder| bookmark_ids.include?(reminder.bookmark_id) }
  end

  def show
  end

  def new
    @reminder = Reminder.new
    authorize @reminder
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.bookmark = @bookmark
    authorize @reminder
    if @reminder.save
      SendTelegramMessageJob.perform_later(current_user.chat_id, @reminder) if current_user.chat_id.present?
      redirect_to reminders_path
    else
      render :new, notice: "Oops. Something went wrong..."
    end
  end

  def message
    @reminder = Reminder.find(params[:id])
    SendTelegramMessageJob.perform_now(current_user.chat_id, @reminder) if current_user.chat_id.present?
    SendTelegramMessageJob.set(wait_until: @reminder.due_date - 86400).perform_later(current_user.chat_id, @reminder) if current_user.chat_id.present?
  end

  def edit
    authorize @reminder
  end

  def update
    authorize @reminder
    if @reminder.update(reminder_params)
      SendTelegramMessageJob.perform_now(current_user.chat_id, @reminder) if current_user.chat_id.present?
      SendTelegramMessageJob.set(wait_until: @reminder.due_date - 86400).perform_later(current_user.chat_id, @reminder) if current_user.chat_id.present?
      redirect_to bookmark_path(:bookmark_id), notice: "Updated successfully"
    else
      render :edit
    end
  end

  def destroy
    authorize @reminder
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
