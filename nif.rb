require 'rubygems'
require 'sinatra'

configure :development do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
end


get '/' do
  markdown :index
end

get '/:number' do
  letter = "TRWAGMYFPDXBNJZSQVHLCKE"[params[:number].to_i % 23].chr
  "#{letter}"
end