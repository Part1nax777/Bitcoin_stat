require "rails_helper"
require "#{Rails.root}/lib/currencies/currency_client.rb"

describe CurrencyClient do

  context "when communicating with external services" do

    it 'return Bitcoin successfully' do
      expect_successful_response('bitcoin', "Sun, 18 Jun 2017 00:00:00 +0000", 2560.21)
    end

    it 'returns Etherium successfully' do
      expect_successful_response('ethereum', 'Tue, 03 Sep 2019 00:00:00 +0000', 179.13)
    end

    it 'returns Nasdaq values successfully' do
      expect_successful_response('nasdaq', 'Fri, 16 Jun 2017 05:00:00 +0000', 6151.76)
    end
  end

  private

  def expect_successful_response(currency, date, value)
    allow(RestClient).to receive(:get).and_return(send("get_successful_#{currency}_response"))
    response = CurrencyClient.send("get_#{currency}s")
    expect(response.keys[0]).to eq(date)
    expect(response.values[0]).to eq(value)
  end

  def get_successful_bitcoin_response
    {
      "Data": [
        {
          "time": 1497744000,
          "close": 2560.21,
          "hight": 2676.04,
          "low": 2570.81,
          "open": 2655.1,
          "volumefrom": 27323.02,
          "volumeto": 71535198.81
        }
      ]
    }.to_json
  end

  def get_successful_ethereum_response
    {
      "Data": [
        {
          "time":1567468800,
          "close":179.13,
          "high":182.93,
          "low":174.83,
          "open":178.76,
          "volumefrom":262992.91,
          "volumeto":47159868.72
        }
      ]
    }.to_json
  end

  def get_successful_nasdaq_response
    {
      "seriess": [
        {
          "obs": [
            [
              1497589200000,
              6151.76
            ],
          ]
        }
      ]
    }.to_json
  end
end