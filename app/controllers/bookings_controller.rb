class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create show] 
  def new
    flight_id = allow_flight_params[:flight_id]
    @num_tickets = allow_flight_params[:num_tickets].to_i
    @booking = Booking.new
    @booking.flight = Flight.find(flight_id)
  end

  def create
    form_params = allow_booking_form_params
    @booking = current_user.bookings.build(form_params.slice(:note, :flight_id))
    form_params[:passengers].each do |passenger| 
      @booking.passengers << Passenger.new(passenger)
    end

    if @booking.save
      flash[:notice] = 'Great! Your booking has been saved!'
      redirect_to @booking
    else
      flash.now[:error] = 'Something\'s wrong. Can\'t save your booking information. Please check your input'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if @booking.user.id == current_user.id
      @booking
    else
      not_found
    end
  end

  private
  def allow_flight_params
    params.permit(:flight_id, :num_tickets, :commit)
  end

  def allow_booking_form_params
    params.require(:booking).permit(:flight_id, :note, passengers: [:name, :email])
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
