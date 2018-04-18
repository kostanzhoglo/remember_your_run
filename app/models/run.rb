class Run < ApplicationRecord

  belongs_to :month

  def format_pace_per_mile
    seconds_per_mile = ((self.duration * 60) / self.distance)
    seconds_per_mile.round
    Time.at(seconds_per_mile).utc.strftime("%M:%S")

    # seconds_remainder = (self.duration).divmod(self.distance)
    # seconds_remainder.round(2)

  end

end
