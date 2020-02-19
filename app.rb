require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "423d101d0b874efebdfe642a8a22a00a"

forecast = ForecastIO.forecast(#lat,#long).to_hash

get "/" do
    results = Geocoder.search(params["q"])
        lat_long = results.first.coordinates #=> [48.856614, 2.3522219] # latitude and longitude
        "The coordinates of #{params["q"]} are: Latitude: #{lat_long[0]} , Longitude: #{lat_long[1]}" 
end

get "/news" do
  # do everything else
end