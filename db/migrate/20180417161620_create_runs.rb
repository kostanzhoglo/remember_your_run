class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.date :date
      t.string :name
      t.float :distance
      t.integer :duration
      t.integer :pace_per_mile
      t.text :notes
      t.integer :number_intervals
      t.integer :interval_length
      t.integer :rest_between_interval

      t.timestamps null: false
    end
  end
end
