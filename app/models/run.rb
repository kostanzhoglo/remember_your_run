class Run < ApplicationRecord

  belongs_to :month

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
    time_array = entry.split(":")
    if time_array.count == 2
      total_seconds = (time_array[0].to_i * 60) + time_array[1].to_i
    elsif time_array.count == 3
      total_seconds = (time_array[0].to_i * 3600) + (time_array[1].to_i * 60) + time_array[2].to_i
    else
      total_seconds = time_array[0].to_i
    end
  end


end
