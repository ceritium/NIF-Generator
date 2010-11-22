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

def cif_checksum(cif)
  unless cif[0] in [A, B, C, D, E, F, G, H, J, K, L, M, N, P, Q, R, S, U, V, W] return false
  unless cif[1,2] in ["01", "02", "03", "53", "54", "04", "05", "06", "07", "57", "08", "58", "59", "60", "61", "62", "63", "64", "65", "09", "10", "11", "72", "12", "13", "14", "56", "15", "70", "16", "17", "55", "18", "19", "20", "71", "21", "22", "23", "24", "25", "26", "27", "28", "78", "79", "80", "81", "82", "83", "84", "85", "29", "92", "93", "30", "73", "31", "32", "33", "74", "34", "35", "76", "36", "94", "37", "38", "75", "39", "40", "41", "91",	"42", "43", "77", "44", "45", "46", "96", "97", "98", "47", "48", "95",	"49", "50", "99", "51", "52"] return false
end