class CreateOpeningHours < ActiveRecord::Migration[7.0]
  def change
    create_table :opening_hours do |t|
      t.string :day
      t.string :opening_time
      t.string :closing_time
      t.references :kinder_gartens, null: false, foreign_key: true

      t.timestamps
    end
  end
end
