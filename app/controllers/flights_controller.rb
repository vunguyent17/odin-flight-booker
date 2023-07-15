class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flightdates = Flight.all.pluck(:departure_time)

    search_params = allow_search_flight_params

    if turbo_frame_request?
      flight_routes = Flight.joins(:route).where('Date(departure_time) = ?', params[:flight_date].to_date)
      flights = flight_routes.joins('JOIN airports ON airport_from_id = airports.id').where('code = ?', search_params[:departure_airport]) &
      flight_routes.joins('JOIN airports ON airport_to_id = airports.id').where('code = ?',search_params[:arrival_airport])
      num_tickets = search_params[:number_of_passengers]
      render partial: "flights/flight_frame", locals: {flights: flights, num_tickets: num_tickets }
    else
      render :index
    end

  end

  private
  def allow_search_flight_params
    params.permit(:departure_airport, :arrival_airport, :number_of_passengers, :flight_date, :commit)
  end
end
