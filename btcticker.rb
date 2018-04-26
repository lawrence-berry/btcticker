#! /bin/ruby

require 'rubygems'
require 'json'
require 'open-uri'

BITSTAMP_URL = "https://www.bitstamp.net/api/ticker/"
CONVERSION_URL = "https://free.currencyconverterapi.com/api/v5/convert?q=USD_GBP&compact=y"

debugging = false

# Returns JSON dictionary:
# last - last BTC price
# high - last 24 hours price high
# low - last 24 hours price low
# volume - last 24 hours volume
# bid - highest buy order
# ask - lowest sell order

# {"to": "GBP", "rate": "0.610923", "from": "USD"}

btc_response = JSON.parse(open(BITSTAMP_URL).read)
btc_rate = btc_response["last"].to_f

conversion_response = JSON.parse(open(CONVERSION_URL).read)
conversion_rate = conversion_response["USD_GBP"]["val"].to_f

if debugging
  puts "#{btc_rate} BTC (USD)"
  puts "#{conversion_rate} USD / GDP"
end

btc_gbp = (conversion_rate * btc_rate)
puts " BTC: #{(sprintf "%.2f", btc_gbp)}(GDP) (#{btc_rate} USD)"
