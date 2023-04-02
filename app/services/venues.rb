class Venues
  API_URL = "https://api.foursquare.com/v2/venues/search"

  CLIENT_ID = "xxx"
  CLIENT_SECRET = "xxx"
  VERSION = "20210808"

  def initialize
  end

  def call(lat, lon)
    response =
      Faraday.get(
        API_URL,
        {
          client_id: CLIENT_ID,
          client_secret: CLIENT_SECRET,
          ll: "#{lat},#{lon}",
          v: VERSION
        },
        { "accept" => "application/json" }
      )
    body = JSON.parse(response.body)
    code = body.dig("meta", "code")
    if code == 200
      body
        .dig("response", "venues")
        .map do |v|
          v.slice("id", "name").merge(
            {
              "location" => v.fetch("location").slice("lat", "lng", "distance")
            }
          )
        end
    else
      raise "Unexpected API response code: #{code}"
    end
  end
end
