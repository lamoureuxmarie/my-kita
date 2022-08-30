class RemoveColumnsFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :email, :string
    remove_column :profiles, :password, :string
  end
end
