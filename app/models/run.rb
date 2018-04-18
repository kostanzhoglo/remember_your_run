class Run < ApplicationRecord

  belongs_to :month

  def format_pace_per_mile
    seconds_per_mile = ((self.duration * 60) / self.distance).round
    Time.at(seconds_per_mile).utc.strftime("%M:%S")
  end

  def format_interval_length
    seconds = self.interval_length
    Time.at(seconds).utc.strftime("%M:%S")
  end

end
