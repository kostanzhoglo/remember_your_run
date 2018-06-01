class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :goal
  has_many :runs
end
