class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @flats = Flat.where.not(latitude: nil, longitude: nil)
    # raise
    if params[:query].present?
      @flats = Flat.geocoded.search_by_location_and_capacity(params[:query])
    else
      @flats = Flat.geocoded
    end

    # @flats = Flat.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])

    @markers = [{
        lat: @flat.latitude,
        lng: @flat.longitude
      }]
    # @flat.geocoded
    #  # @flat = Flat.geocoded
    #  @marker = @flat.map do |flat|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    # end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :location, :price_per_night, :capacity, photos: [])
  end
end
