class AddStatusToBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookmarks, :status
    add_column :bookmarks, :status, :integer
  end
end
