class Month < ApplicationRecord

  has_many :runs

  validates :name, :year, presence: true

  def month_distance
    self.runs.collect {|run| run.distance}.sum
  end

end
