class AddChatIdToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :chat_id, :string
  end
end
