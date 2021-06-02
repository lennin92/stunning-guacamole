class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  # GET /bookings
  def index
    @current_user = AuthorizeApiRequestCommand.call(request.headers).result
    @bookings = Booking.user_relations(@current_user[:id],@current_user[:id])

    render json: @bookings
  end

  # POST /bookings
  def create
    @current_user = AuthorizeApiRequestCommand.call(request.headers).result
    @schedule = Schedule.find(booking_params[:schedule_id])
    @booking = Booking.create(
      :user => @current_user,
      :schedule => @schedule,
    )

    if @booking.save
      @activity = Activity.find(@schedule[:activity_id])
      BookingMailer.with(
        activity: @activity[:name],
        client: @current_user[:username],
        start: @schedule[:start],
        end: @schedule[:end],
        admin_email:  @activity.user.email
      ).new_booking_email.deliver_later
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:schedule_id, :_id)
    end
end
