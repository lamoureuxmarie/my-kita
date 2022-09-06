class AddKitaReferenceToRatings < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :kinder_garten, null: false, foreign_key: true
  end
end
