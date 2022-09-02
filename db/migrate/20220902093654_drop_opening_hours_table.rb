class DropOpeningHoursTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :opening_hours
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
