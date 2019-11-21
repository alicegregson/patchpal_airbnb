class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @home = true

    @flats = Flat.geocoded

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end
end
