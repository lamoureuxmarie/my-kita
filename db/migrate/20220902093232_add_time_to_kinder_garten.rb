class AddTimeToKinderGarten < ActiveRecord::Migration[7.0]
  def change
    add_column :kinder_gartens, :opening_time, :string
    add_column :kinder_gartens, :closing_time, :string
  end
end
