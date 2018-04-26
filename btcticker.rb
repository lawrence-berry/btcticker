#! /bin/ruby

require 'json'
require 'open-uri'

BITSTAMP_URL = "https://www.bitstamp.net/api/ticker/"
CONVERSION_URL = "https://free.currencyconverterapi.com/api/v5/convert?q=USD_GBP&compact=y"

btc_response = JSON.parse(open(BITSTAMP_URL).read)
btc_rate = btc_response["last"].to_f

conversion_response = JSON.parse(open(CONVERSION_URL).read)
conversion_rate = conversion_response["USD_GBP"]["val"].to_f

btc_gbp = (conversion_rate * btc_rate)
puts " BTC: #{(sprintf "%.2f", btc_gbp)}(GDP) (#{btc_rate} USD)"
