class ChangeTwoIntervalColumnsInRunsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :runs, :interval_length, :string
    change_column :runs, :rest_between_interval, :string
  end
end
