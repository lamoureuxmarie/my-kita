class RemoveBookmarkFromTemplates < ActiveRecord::Migration[7.0]
  def change
    remove_reference :templates, :bookmark, null: false, foreign_key: true
  end
end
