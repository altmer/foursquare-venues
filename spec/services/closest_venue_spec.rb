require 'rails_helper'

RSpec.describe ClosestVenue do
  let(:venues_stub) { double(:venues) }
  let(:venues) do
    [
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
    ]
  end

  subject { ClosestVenue.new(venues_api: venues_stub) }

  describe '#call' do
    let(:lat) { '40.74224' }
    let(:lon) { '-73.99386' }

    before do
      expect(venues_stub).to receive(:call).with(lat, lon).and_return(venues)
    end

    it 'returns sorted venues list' do
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
