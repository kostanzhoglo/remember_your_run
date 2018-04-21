class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def total_seconds(entry)
    time_array = entry.split(":").collect {|index| index.to_i}
    if time_array.count == 2
      total_seconds = (time_array[0] * 60) + time_array[1]
    elsif time_array.count == 3
      total_seconds = (time_array[0] * 3600) + (time_array[1] * 60) + time_array[2]
    else
      total_seconds = time_array[0]
    end
  end




end
