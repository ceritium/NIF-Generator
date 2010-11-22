require 'sinatra'


configure :development do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
end


get '/' do
  "hello lol"
end

get '/:number' do
  params[:number]
end