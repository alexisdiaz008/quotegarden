require 'sinatra'

get '/' do
  # File.open('index.html')
  # send_file 'index.html', :type => 'text/html; charset=utf-8'
  File.read(File.join('html', 'index.html'))
end