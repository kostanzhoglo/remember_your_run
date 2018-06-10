class Month < ApplicationRecord
  has_many :runs
  belongs_to :user

  validates :name, :year, presence: true

  def month_mileage
    self.runs.collect {|run| run.distance}.sum
  end

  def month_total_run_time
    self.runs.collect {|run| total_seconds(run.duration)}.sum
  end

  def month_pace
    if !self.runs.empty?
      seconds_per_mile = (month_total_run_time / month_mileage).round
      Time.at(seconds_per_mile).utc.strftime("%_M:%S")
    else
      "You haven't run yet this month!"
    end
  end

end


# def self.fastest_pace
# end
#
# def self.most_mileage
# end
