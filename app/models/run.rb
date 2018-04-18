class Run < ApplicationRecord

  belongs_to :month

  def format_pace_per_mile
    seconds_per_mile = ((self.duration * 60) / self.distance).round
    Time.at(seconds_per_mile).utc.strftime("%_M:%S")
  end

  def format_interval_length
    seconds = self.interval_length
    Time.at(seconds).utc.strftime("%_M:%S")
  end

  def format_rest_between
    seconds = self.rest_between_interval
    Time.at(seconds).utc.strftime("%_M:%S")
  end

  def total_seconds
    time_array = self.duration.split(":")
    if time_array.count == 2
      total_seconds = (time_array[0] * 60) + time_array[1]
    elsif time_array.count == 3
      total_seconds = (time_array[0] * 3600) + (time_array[1] * 60) + time_array[2]
    else
      total_seconds = time_array[0]
    end

  end


end
