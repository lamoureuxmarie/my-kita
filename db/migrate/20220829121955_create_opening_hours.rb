class CreateOpeningHours < ActiveRecord::Migration[7.0]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.string :opening_time
      t.string :closing_time

      t.timestamps
    end
  end
end
