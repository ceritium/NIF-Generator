require 'rubygems'
require 'sinatra'

configure :development do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
end


get '/' do
  markdown :index
end

# Para un codigo del tipo 12345678
get %r{^\/(\d{8})$} do |code|
  p code
  letter = "TRWAGMYFPDXBNJZSQVHLCKE"[code.to_i % 23].chr
  "#{letter}"
end

not_found do
  "false"
end
