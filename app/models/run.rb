class Run < ApplicationRecord
  belongs_to :month
  belongs_to :user

  validates :date, :name, :distance, :duration, :interval_length, :rest_between_interval, presence: true
  validates_format_of :duration, :interval_length, :rest_between_interval, with: /\A[0-9]*:?[0-9]*:[0-9][0-9]\z/, message: "Input as time 00:00"

    def self.fastest_pace
      Run.order(pace_per_mile: :asc).first(3)
    end

    def self.longest_runs
      Run.order(distance: :desc).first(5)
    end

    def format_pace_per_mile
      if self.duration == ""
        begin
          raise InputError
        rescue InputError => error
          # puts error.duration_message
        self.duration = "99:59:59"
        end
      end
      if self.distance == nil || self.distance == 0
        begin
          raise InputError
        rescue InputError => error
          # puts error.distance_message
          self.distance = 99999999
        end
      end
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

    class InputError < StandardError
      # def distance_message
      #   "You must enter a number for distance."
      # end
      #
      # def duration_message
      #   "You must enter a time format for duration (example 40:00 would equal 40 minutes, zero seconds)."
      # end
    end

end
