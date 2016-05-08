require 'sinatra'

get '/' do
  File.open('index.html')
end