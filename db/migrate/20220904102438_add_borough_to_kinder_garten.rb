class AddBoroughToKinderGarten < ActiveRecord::Migration[7.0]
  def change
    add_column :kinder_gartens, :borough, :string
  end
end
