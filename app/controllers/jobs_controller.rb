class JobsController < ApplicationController
  def fetch_id
    # authorize @job
    FetchTelegramChatIdsJob.perform_now
    redirect_to bookmarks_path
  end
end
