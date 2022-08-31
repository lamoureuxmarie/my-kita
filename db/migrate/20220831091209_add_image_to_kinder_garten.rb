class AddImageToKinderGarten < ActiveRecord::Migration[7.0]
  def change
    add_column :kinder_gartens, :image_url, :string
  end
end
