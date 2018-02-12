require 'sinatra'
require 'httparty'
require 'google_custom_search_api'

configure :development do
require 'better_errors'
  use BetterErrors::Middleware
  # you need to set the application root in order to abbreviate filenames
  # within the application:
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  # @quote_hash=JSON.parse(HTTParty.get('http://quotesondesign.com/api/3.0/api-3.0.json'))
  # @quote = HTTParty.get('https://healthruwords.p.mashape.com/v1/quotes/')
  @quote = JSON.parse(HTTParty.get('https://andruxnet-random-famous-quotes.p.mashape.com/?cat=movies', 
    :headers => {
    "X-Mashape-Key" => "#{ENV['MASHAPE_KEY']}",
    "Content-Type" => "application/x-www-form-urlencoded",
    "Accept" => "application/json"
  }))
  # results = GoogleCustomSearchApi.search(@quote['author'])
  # raise
  # File.read(File.join('index.html'))
  erb :index
end