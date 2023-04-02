class Api::VenuesController < ApplicationController
  def index
    venues = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
      Venues.new.call(params[:lat], params[:lon])
    end
    render json: { venues: venues }
  end

  private

  def cache_key
    "venues_#{params[:lat]}_#{params[:lon]}"
  end
end
