class Flight < ApplicationRecord
  belongs_to :route

  def departure_airport
    route&.airport_from
  end
  
  def arrival_airport
    route&.airport_to
  end
end
