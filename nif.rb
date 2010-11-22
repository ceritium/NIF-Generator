require 'rubygems'
require 'sinatra'

configure :development do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
end


get '/' do
  'Hello world!'
end