class ChangeColumnsInRunsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :runs, :date, :string
    change_column :runs, :duration, :string
    change_column :runs, :pace_per_mile, :string
  end
end
