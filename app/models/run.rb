class Run < ApplicationRecord

  belongs_to :month

  validates :date, :name, :distance, presence: true
  validates :duration, :interval_length, :rest_between_interval, presence: true
  validates_format_of :duration, :interval_length, :rest_between_interval, with: /\A[0-9]*:?[0-9]*:[0-9][0-9]\z/, message: "Input as time 00:00"

    def self.fastest_pace
      self.all.order("pace_per_mile ASC").limit(3)
    end



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

end
