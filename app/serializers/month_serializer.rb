class MonthSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :goal
end
