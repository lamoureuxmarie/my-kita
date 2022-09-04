class RemoveSuburbFromKinderGarten < ActiveRecord::Migration[7.0]
  def change
    remove_column :kinder_gartens, :suburb, :string
  end
end
