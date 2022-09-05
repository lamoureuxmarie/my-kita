class AddTelegramTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :telegram_token, :string
  end
end
