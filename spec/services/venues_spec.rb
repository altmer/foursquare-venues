require 'rails_helper'

RSpec.describe Venues do
  subject { Venues.new }

  describe '#call' do
    context '200 response' do
      let(:response) { File.read('spec/fixtures/venues.json') }
      let(:lat) { '40.74224' }
      let(:lon) { '-73.99386' }

      before do
        stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=#{Venues::CLIENT_ID}&client_secret=#{Venues::CLIENT_SECRET}&ll=#{lat},#{lon}&v=#{Venues::VERSION}")
          .to_return(status: 200, body: response)
      end

      it 'returns venues info from foursquare API' do
        expect(subject.call(lat, lon)).to eq([
          {
            "id" => "4c225ae47e85c9283ee5bb21",
            "location" => {
              "distance" => 58, "lat" => 40.741739139805574, "lng" => -73.99365296900864
            },
            "name"=>"Trader Joe's"
          },
          {
            'id' => '5642aef9498e51025cf4a7a5',
            'name' => 'Mr. Purple',
            'location' => {
              'distance' => 8,
              'lat' => 40.72173744277209,
              'lng' => -73.98800687282996,
            }
          }
        ])
      end
    end
  end
end
