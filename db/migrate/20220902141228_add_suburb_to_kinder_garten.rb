class AddSuburbToKinderGarten < ActiveRecord::Migration[7.0]
  def change
    add_column :kinder_gartens, :suburb, :string
  end
end
