class AddForeignKeyColumnsToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :month_id, :integer
    add_column :runs, :user_id, :integer
  end
end
