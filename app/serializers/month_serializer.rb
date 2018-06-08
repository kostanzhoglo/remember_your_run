class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :goal, :month_mileage, :month_pace
  has_many :runs
end
