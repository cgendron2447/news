require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "423d101d0b874efebdfe642a8a22a00a"

url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=67bf1b502ba740c782d2d60f3b946e3d"
@news = HTTParty.get(url).parsed_response.to_hash
@all_headlines = @news["articles"]

@newsfeed = []

for articles in @all_headlines
    @newsfeed << "#{articles["title"]}"
end

pp @newsfeed