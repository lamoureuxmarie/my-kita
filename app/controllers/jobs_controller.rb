class JobsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def fetch_id
    FetchTelegramChatIdsJob.perform_now
    redirect_to bookmarks_path
  end
end
