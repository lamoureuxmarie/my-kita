class JobsController < ApplicationController
  def fetch_id
    FetchTelegramChatIdsJob.perform_now
    redirect_to bookmarks_path
  end
end
