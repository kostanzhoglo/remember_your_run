class RunSerializer < ActiveModel::Serializer
  attributes :id, :date, :name, :distance, :duration, :pace_per_mile, :notes, :number_intervals, :interval_length, :rest_between_interval
  belongs_to :month
end
