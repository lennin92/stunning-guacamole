
class BookingMailer < ApplicationMailer
  def new_booking_email
    @activity = params[:activity]
    @start = params[:start]
    @end = params[:end]
    @client = params[:client]

    mail(to: params[:admin_email], subject: "You got a new Booking")
  end
end