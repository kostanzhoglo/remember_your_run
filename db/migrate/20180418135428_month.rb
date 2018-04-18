class Month < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.string :name
      t.string :year
      t.string :goal
      t.float :month_distance

      t.timestamps null: false
    end
  end
end
