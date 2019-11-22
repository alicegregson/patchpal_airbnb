class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    authorize @review
    @review.booking = @booking
    if @review.save
      redirect_to flat_path(@booking.flat)
    else
      render 'flats/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
