class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :name
      t.string :year
      t.float :month_distance
      t.string :goal

      t.timestamps null: false
    end
  end
end
