require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "423d101d0b874efebdfe642a8a22a00a"

get "/" do
   view "ask"
end

get "/news" do
    results = Geocoder.search(params["q"])
        lat_long = results.first.coordinates 
        @latitude = lat_long[0]
        @longitude = lat_long[1]
        @forecast = ForecastIO.forecast(@latitude,@longitude).to_hash
        @current_temp = @forecast["currently"]["apparentTemperature"]
        @current_conditions = @forecast["currently"]["summary"]
        view "response"
end