class ChangeDataTypeOfChatId < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :chat_id, :string
  end
end
