class Airport < ApplicationRecord
  has_many :from_routes, class_name: "Route", foreign_key: :airport_from_id
  has_many :to_routes, class_name: "Route", foreign_key: :airport_to_id
  
  def departure_flights
    Flight.joins(:route).where("airport_from_id = ?", id)
  end

  def arrival_flights
    Flight.joins(:route).where("airport_to_id = ?", id)
  end
end
