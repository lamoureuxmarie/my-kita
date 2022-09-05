class AddChatIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :chat_id, :integer
  end
end
