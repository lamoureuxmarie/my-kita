class AddWebsiteToKinderGartens < ActiveRecord::Migration[7.0]
  def change
    add_column :kinder_gartens, :website, :string
  end
end
