class QuoteOfTheDay
  def initialize; end

  def call
    response = Faraday.get('https://quotes.rest/qod')
    raise 'requesting quotes failed' if response.status >= 300

    content = JSON.parse(response.body)
    quote = content.dig('contents', 'quotes').first
    quote.slice('quote', 'author')
  end
end
