class Month < ApplicationRecord

  has_many :runs

  validates :name, :year, presence: true

  def month_distance
    self.runs.collect {|run| run.distance}.sum
  end

  def month_total_run_time
    self.runs.collect {|run| total_seconds(run.duration)}.sum
  end

  def month_pace
    seconds_per_mile = (month_total_run_time / month_distance).round
    Time.at(seconds_per_mile).utc.strftime("%_M:%S")
  end

end
