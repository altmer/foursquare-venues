class ClosestVenue
  def initialize(venues_api:)
    @venues_api = venues_api
  end

  def call(lat, lon)
    venues = venues_api.call(lat, lon)
    venues.sort { |l, r| distance(l, [lat, lon]) <=> distance(r, [lat, lon]) }
  end

  private

  attr_reader :venues_api

  def distance(venue, location)
    venue_location = venue.fetch('location')
    Math.sqrt(
      ((location[0].to_f - venue_location.fetch('lat').to_f) ** 2) +
      ((location[1].to_f - venue_location.fetch('lng').to_f) ** 2)
    )
  end
end
