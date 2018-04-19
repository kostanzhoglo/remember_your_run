class Run < ApplicationRecord

  belongs_to :month

  validates :date, :name, :distance, presence: true
  validates :duration, :interval_length, :rest_between_interval, presence: true
  validates_format_of :duration, :interval_length, :rest_between_interval, with: /\A[0-9]*:?[0-9][0-9]:[0-9][0-9]\z/

    def format_pace_per_mile
      seconds_per_mile = (total_seconds(self.duration) / self.distance).round
      Time.at(seconds_per_mile).utc.strftime("%_M:%S")
    end

    def format_interval_length
      seconds = total_seconds(self.interval_length)
      Time.at(seconds).utc.strftime("%_M:%S")
    end

    def format_rest_between
      seconds = total_seconds(self.rest_between_interval)
      Time.at(seconds).utc.strftime("%_M:%S")
    end

    def total_seconds(entry)
      time_array = entry.split(":").collect {|index| index.to_i}
      if time_array.count == 2
        total_seconds = (time_array[0] * 60) + time_array[1]
      elsif time_array.count == 3
        total_seconds = (time_array[0] * 3600) + (time_array[1] * 60) + time_array[2]
      else
        total_seconds = time_array[0]
      end
    end


end
