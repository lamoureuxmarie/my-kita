class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :title
      t.string :content
      t.datetime :due_date
      t.references :bookmark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
