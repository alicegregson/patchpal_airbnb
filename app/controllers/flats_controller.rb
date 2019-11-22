class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @flats = policy_scope(Flat).geocoded.search_by_location_and_capacity(params[:query])
    else
      @flats = policy_scope(Flat).geocoded
    end

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def show
    # DO NOT DELETE THIS IT IS TO DO WITH CSS LAYOUT
    @home = true
    # ----------------------------------------------
    @flat = Flat.find(params[:id])
    authorize @flat

    @markers = [{
        lat: @flat.latitude,
        lng: @flat.longitude
      }]

    # @booking = Booking.find(params[:booking_id])
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.destroy

    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :location, :price_per_night, :capacity, photos: [])
  end
end
