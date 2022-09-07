class AddUserToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_reference :templates, :user, null: false, foreign_key: true
  end
end
