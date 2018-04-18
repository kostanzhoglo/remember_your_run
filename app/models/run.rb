class Run < ApplicationRecord

  belongs_to :month

  def format_pace_per_mile
    10

  end

end
