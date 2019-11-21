class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
    @review = Review.new
  end

  def new
    @flat = Flat.find(params[:flat_id])
    # authorize @flat
    @booking = Booking.new
    authorize @booking
    @booking.flat = @flat
    # authorize @flat
  end

  def create
    @flat = Flat.find(params[:flat_id])
    # authorize @flat
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.flat = @flat
    @booking.user = current_user
    # authorize @flat

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :number_of_guest, :flat_id)
  end
end
