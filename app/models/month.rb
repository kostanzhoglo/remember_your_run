class Month < ApplicationRecord

  has_many :runs

  validates :name, :year, presence: true



end
