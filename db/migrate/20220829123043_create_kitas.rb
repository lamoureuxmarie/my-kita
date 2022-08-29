class CreateKitas < ActiveRecord::Migration[7.0]
  def change
    create_table :kitas do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :email
      t.string :pedagogical_focus
      t.string :thematic_focus
      t.integer :total_places
      t.integer :places_over_3
      t.integer :places_under_3
      t.references :opening_hour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
