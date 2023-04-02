require 'rails_helper'

RSpec.describe QuoteOfTheDay do
  let(:response) do
    {
      'success' => {
        'total' => 1
      },
      'contents' => {
        'quotes' => [
          {
            'quote' => "You defeated me But you won't defeat me again Because you have grown all you can grow.. But I am still growing (about Mount Everest).",
            'length' => '135',
            'author' => 'Edmund Hillary',
            'tags' => %w[defeat grow himalayas inspire mountaineering],
            'category' => 'inspire',
            'language' => 'en',
            'date' => '2021-10-28',
            'permalink' => 'https://theysaidso.com/quote/edmund-hillary-you-defeated-me-but-you-wont-defeat-me-again-because-you-have-gro',
            'id' => 'x6qwzES0r8z3ow2IOadxcAeF',
            'background' => 'https://theysaidso.com/img/qod/qod-inspire.jpg',
            'title' => 'Inspiring Quote of the day'
          }
        ]
      },
      'baseurl' => 'https://theysaidso.com',
      'copyright' => {
        'year' => 2023,
        'url' => 'https://theysaidso.com'
      }
    }
  end
  subject { QuoteOfTheDay.new }

  describe '#call' do
    before do
      stub_request(:get, 'https://quotes.rest/qod').to_return(status: 200, body: response.to_json)
    end

    it 'returns quote of the day with author' do
      expect(subject.call).to eq(
        {
          'quote' => "You defeated me But you won't defeat me again Because you have grown all you can grow.. But I am still growing (about Mount Everest).",
          'author' => 'Edmund Hillary'
        }
      )
    end
  end
end
