class FetchTelegramChatIdsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    response = HTTParty.get("https://api.telegram.org/bot#{ENV['TELEGRAM']}/getUpdates")
    telegram_infos = response["result"].map do |r|
      { telegram_token: r.dig("message", "text"), chat_id: r.dig("message", "chat", "id") }
    end.compact_blank
    telegram_infos.each do |t|
      user = User.find_by(telegram_token: t[:telegram_token])
      next unless user.present?

      user.update(chat_id: t[:chat_id].to_s)
    end
  end
end
