class RemindersController < ApplicationController
  before_action :find_reminder, only: %i[show edit update destroy]
  before_action :find_bookmark, only: %i[new create]

  def index
    @reminders = policy_scope(Reminder)
    @reminders = Reminder.all
  end

  def show
  end

  def new
    authorize @reminder
    @reminder = Reminder.new
  end

  def create
    authorize @reminder
    @reminder = Reminder.new(reminder_params)
    @reminder.bookmark = @bookmark
    if @reminder.save
      redirect_to reminders_path
    else
      render :new, notice: "Oops. Something went wrong..."
    end
  end

  def edit
    authorize @reminder
  end

  def update
    authorize @reminder
    if @reminder.update(reminder_params)
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
