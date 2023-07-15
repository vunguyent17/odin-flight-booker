class Route < ApplicationRecord
  belongs_to :airport_from, class_name: "Airport"
  belongs_to :airport_to,  class_name: "Airport"
  has_many :flights
end
